// diskbench_mirror — diskbench extended with multi-disk mirror routing.
//
// Extra paths after the first are mirrors: byte-identical copies of the same
// shard on other disks. Reads are routed across replicas by estimated finish
// time, and a share-of-bytes matrix shows how the router divided the work at
// each queue depth.
//
// The routing algorithm here is a simplified approximation of the Swift
// MirrorRouter in CheckpointMirror.swift. Both pick the replica estimated to
// finish soonest, but they differ in how they build that estimate:
//
//   Swift (runtime):  aggregate throughput — totalBytes / busyTime — so giving
//                     a replica more concurrent work makes it measure *faster*
//                     up to its ceiling. Measurements expire after one second
//                     idle, forcing a reprobe.
//
//   C (this file):    per-read seconds/byte with exponential smoothing (α=1/8),
//                     multiplied by queued *count*. This is cheaper to compute
//                     but can lock out a replica after one unlucky measurement,
//                     because there is no expiry to force a reprobe.
//
// For benchmarking the shape of the queue-depth curve and the approximate split
// ratio this is adequate. For an exact model of the runtime's routing, see the
// Swift source.
//
// Absolute GB/s can be inflated by the page cache. When the test file fits in
// RAM, the OS serves reads from memory even with F_NOCACHE, because F_NOCACHE
// only bypasses future caching — it does not evict pages already resident.
// Trust the shape of the queue-depth curve and the mirror split percentages;
// for absolute throughput, use a file larger than RAM or cross-check with
// iostat.
//
// cc -O2 -o diskbench_mirror diskbench_mirror.c -lpthread
#define _DARWIN_C_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <pthread.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <stdint.h>
#include <math.h>

static double now(void) {
    struct timeval tv; gettimeofday(&tv, NULL);
    return tv.tv_sec + tv.tv_usec / 1e6;
}

#define MAX_REPLICAS 8

// Byte-identical copies of one shard, possibly on different disks. Each read
// goes to whichever replica is estimated to finish first: (queued + 1) times
// that replica's measured seconds-per-byte.
//
// An even split would be slower than using only the fast disk whenever few
// reads are in flight, because every second read would block on the slow disk
// with nothing to overlap it. The estimate avoids that: at low concurrency the
// fast disk wins every claim, and work only spills to the slow disk once the
// fast one has a backlog.
typedef struct {
    int fds[MAX_REPLICAS]; int n;
    int queued[MAX_REPLICAS];
    double spb[MAX_REPLICAS];      // seconds per byte, exponentially weighted
    double served[MAX_REPLICAS];   // bytes, for the split report
    pthread_mutex_t mu;
} mirror_t;

static int mirror_claim(mirror_t *m) {
    pthread_mutex_lock(&m->mu);
    int chosen = 0; double soonest = INFINITY;
    for (int i = 0; i < m->n; i++) {
        double finish = (m->queued[i] + 1) * m->spb[i];
        if (finish < soonest) { soonest = finish; chosen = i; }
    }
    m->queued[chosen]++;
    pthread_mutex_unlock(&m->mu);
    return chosen;
}

static void mirror_release(mirror_t *m, int i, size_t bytes, double seconds) {
    pthread_mutex_lock(&m->mu);
    m->queued[i]--;
    if (bytes > 0 && seconds > 0) {
        m->served[i] += (double)bytes;
        double sample = seconds / (double)bytes;
        // An eighth of the weight on the newest sample: fast enough to follow a
        // disk that degrades part-way through, slow enough that one descheduled
        // read cannot redirect the batch behind it.
        m->spb[i] = m->spb[i] > 0 ? m->spb[i] + (sample - m->spb[i]) / 8 : sample;
    }
    pthread_mutex_unlock(&m->mu);
}

typedef struct {
    mirror_t *mirror; size_t fsize; size_t rsize; int nreads; unsigned seed;
    void *buf; double bytes;
} job_t;

static void *worker(void *p) {
    job_t *j = (job_t *)p;
    size_t nrec = j->fsize / j->rsize;
    unsigned s = j->seed;
    for (int i = 0; i < j->nreads; i++) {
        s = s * 1103515245u + 12345u;
        size_t rec = (size_t)((s >> 8) % nrec);
        off_t off = (off_t)rec * (off_t)j->rsize;
        int replica = mirror_claim(j->mirror);
        double t0 = now();
        ssize_t got = pread(j->mirror->fds[replica], j->buf, j->rsize, off);
        if (got < 0) { perror("pread"); exit(1); }
        mirror_release(j->mirror, replica, (size_t)got, now() - t0);
        j->bytes += got;
    }
    return NULL;
}

// `share` receives each replica's fraction of the bytes read, or may be NULL.
static double run(const char **paths, int npaths, size_t rsize, int qd, int nocache,
                  int total_reads, double *share) {
    mirror_t m; memset(&m, 0, sizeof(m));
    pthread_mutex_init(&m.mu, NULL);
    m.n = npaths;
    for (int i = 0; i < npaths; i++) {
        m.fds[i] = open(paths[i], O_RDONLY);
        if (m.fds[i] < 0) { perror("open"); exit(1); }
        if (nocache) fcntl(m.fds[i], F_NOCACHE, 1);
        fcntl(m.fds[i], F_RDAHEAD, 0);
    }
    struct stat st; fstat(m.fds[0], &st);

    pthread_t th[64]; job_t jobs[64];
    if (qd > 64) qd = 64;
    for (int i = 0; i < qd; i++) {
        jobs[i].mirror = &m; jobs[i].fsize = st.st_size; jobs[i].rsize = rsize;
        jobs[i].nreads = total_reads / qd; jobs[i].seed = 1234567u + i * 7919u;
        jobs[i].bytes = 0;
        if (posix_memalign(&jobs[i].buf, 16384, rsize)) { perror("memalign"); exit(1); }
    }
    double t0 = now();
    for (int i = 0; i < qd; i++) pthread_create(&th[i], NULL, worker, &jobs[i]);
    double bytes = 0;
    for (int i = 0; i < qd; i++) { pthread_join(th[i], NULL); bytes += jobs[i].bytes; free(jobs[i].buf); }
    double dt = now() - t0;
    for (int i = 0; i < npaths; i++) close(m.fds[i]);
    pthread_mutex_destroy(&m.mu);
    if (share) for (int i = 0; i < npaths; i++) share[i] = m.served[i] / bytes;
    return bytes / dt / 1e9;  // GB/s
}

static double run_seq(const char *path, size_t rsize, int nocache, size_t limit) {
    int fd = open(path, O_RDONLY);
    if (nocache) fcntl(fd, F_NOCACHE, 1);
    void *buf; if (posix_memalign(&buf, 16384, rsize)) exit(1);
    double t0 = now(); size_t total = 0;
    while (total < limit) {
        ssize_t got = pread(fd, buf, rsize, total);
        if (got <= 0) break;
        total += got;
    }
    double dt = now() - t0; free(buf); close(fd);
    return total / dt / 1e9;
}

int main(int argc, char **argv) {
    if (argc < 3) {
        fprintf(stderr, "usage: diskbench_mirror <testfile> <mirror-of-testfile> [...]\n");
        return 1;
    }
    const char **paths = (const char **)&argv[1];
    int npaths = argc - 1;
    if (npaths > MAX_REPLICAS) npaths = MAX_REPLICAS;
    struct stat st;
    for (int i = 0; i < npaths; i++) {
        struct stat s;
        if (stat(paths[i], &s)) { perror("stat"); return 1; }
        if (i == 0) st = s;
        else if (s.st_size != st.st_size) {
            fprintf(stderr, "%s is %lld bytes but %s is %lld — mirrors must be identical\n",
                    paths[i], (long long)s.st_size, paths[0], (long long)st.st_size);
            return 1;
        }
        printf("%s: %s (%.1f GB)\n", i ? "mirror" : "file", paths[i], s.st_size / 1e9);
    }
    printf("page size: %d\n\n", getpagesize());

    printf("== sequential ==\n");
    // Sequential stays on the first path: one read at a time cannot overlap two
    // disks, so a mirror has nothing to contribute to this number.
    printf("  1 MiB reads, F_NOCACHE : %6.2f GB/s\n", run_seq(paths[0], 1u << 20, 1, 4ull << 30));
    printf("  1 MiB reads, cached    : %6.2f GB/s\n", run_seq(paths[0], 1u << 20, 0, 4ull << 30));

    size_t sizes[] = { 2764800, 2768896, 4096, 16384, 65536, 1u << 20 };
    const char *names[] = { "expert 2.7648MB", "expert pad 16K", "4 KiB", "16 KiB", "64 KiB", "1 MiB" };
    int qds[] = { 1, 2, 4, 8, 16, 32 };
    double first_share[sizeof(sizes)/sizeof(*sizes)][sizeof(qds)/sizeof(*qds)];

    for (int nc = 1; nc >= 0; nc--) {
        printf("\n== random pread, %s ==\n", nc ? "F_NOCACHE" : "page-cached");
        printf("%-18s", "record");
        for (unsigned q = 0; q < sizeof(qds)/sizeof(*qds); q++) printf("  QD%-2d ", qds[q]);
        printf("   (GB/s)\n");
        for (unsigned s = 0; s < sizeof(sizes)/sizeof(*sizes); s++) {
            printf("%-18s", names[s]);
            for (unsigned q = 0; q < sizeof(qds)/sizeof(*qds); q++) {
                int reads = sizes[s] > 1u<<20 ? 600 : (sizes[s] >= 65536 ? 8000 : 40000);
                reads = (reads / qds[q]) * qds[q];
                if (reads < qds[q]) reads = qds[q];
                double share[MAX_REPLICAS];
                double gbs = run(paths, npaths, sizes[s], qds[q], nc, reads, share);
                if (nc) first_share[s][q] = share[0];
                printf(" %5.2f ", gbs);
                fflush(stdout);
            }
            printf("\n");
        }
    }

    // Without this matrix there is no way to tell whether a mirror is actually
    // being used or merely configured — the GB/s number alone does not show it.
    printf("\n== share of bytes on %s, F_NOCACHE ==\n", paths[0]);
    printf("%-18s", "record");
    for (unsigned q = 0; q < sizeof(qds)/sizeof(*qds); q++) printf("  QD%-2d ", qds[q]);
    printf("\n");
    for (unsigned s = 0; s < sizeof(sizes)/sizeof(*sizes); s++) {
        printf("%-18s", names[s]);
        for (unsigned q = 0; q < sizeof(qds)/sizeof(*qds); q++)
            printf(" %4.0f%% ", 100.0 * first_share[s][q]);
        printf("\n");
    }

    // Pinned to the first path: this is a per-read latency, and routing it
    // across disks would average two different latencies into one number.
    printf("\n== single-read latency (QD1, F_NOCACHE) ==\n");
    for (unsigned s = 0; s < sizeof(sizes)/sizeof(*sizes); s++) {
        int reads = 400;
        double t0 = now();
        double gbs = run(paths, 1, sizes[s], 1, 1, reads, NULL);
        (void)gbs; double dt = now() - t0;
        printf("  %-18s %7.3f ms/read\n", names[s], dt * 1000.0 / reads);
    }
    return 0;
}
