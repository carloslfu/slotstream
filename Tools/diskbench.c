// diskbench — measures the exact IO pattern slotstream depends on:
// random preads of expert-record size (2.7648 MB) and ngram-page size (4-16 KiB),
// across queue depths, with and without F_NOCACHE.
//
// Extra paths after the first are treated as mirrors: byte-identical copies of
// the same shard on other disks, routed the way MirrorRouter routes them in the
// runtime. That shows how the router splits the reads, which a single-path run
// cannot.
//
// Read the absolute GB/s here with the caution this file already earned: every
// cell re-reads the same file, so on a machine with more RAM than that file the
// unified buffer cache serves much of the traffic and F_NOCACHE does not evict
// what is already cached. Mirrored across a 10 GB shard on a 32 GB Mac mini
// this reported 8.40 GB/s from two disks that together deliver 4.9 GB/s,
// measured at the device with `iostat -d disk0 disk4`. Trust the split matrix
// and the shape of the queue-depth curve; for an absolute number use a working
// set larger than RAM and confirm it against iostat.
//
// cc -O2 -o diskbench diskbench.c -lpthread
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

static double now(void) {
    struct timeval tv; gettimeofday(&tv, NULL);
    return tv.tv_sec + tv.tv_usec / 1e6;
}

#define MAX_REPLICAS 8

// A set of byte-identical copies of one shard. Any replica can serve any read,
// but the disks need not be equally fast — 3.2 GB/s external against 1.8 GB/s
// internal on the qualifying Mac mini — so splitting reads evenly is worse than
// using the fast disk alone whenever few reads are in flight. Each read goes to
// whichever replica is estimated to finish it first, (queued + 1) x that
// replica's measured seconds per byte, which is the rule MirrorRouter applies
// in the runtime. No disk is described to it: the per-byte cost is learned from
// each replica's own completions.
typedef struct {
    int fds[MAX_REPLICAS]; int n;
    int queued[MAX_REPLICAS];
    double spb[MAX_REPLICAS];      // seconds per byte, exponentially weighted
    double served[MAX_REPLICAS];   // bytes, for the split report
    pthread_mutex_t mu;
} mirror_t;

static int mirror_claim(mirror_t *m) {
    pthread_mutex_lock(&m->mu);
    int chosen = 0; double soonest = 1e300;
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
    if (argc < 2) {
        fprintf(stderr, "usage: diskbench <testfile> [mirror-of-testfile ...]\n");
        return 1;
    }
    const char **paths = (const char **)&argv[1];
    int npaths = argc - 1;
    if (npaths > MAX_REPLICAS) npaths = MAX_REPLICAS;
    struct stat st;
    for (int i = 0; i < npaths; i++) {
        struct stat s;
        if (stat(paths[i], &s)) { perror("stat"); return 1; }
        // Mirrors must be the same file, or the offsets address different data.
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
    // Share of bytes the router sent to the first path, per record size and
    // queue depth, from the F_NOCACHE pass. Reporting it is the only way to
    // tell a mirror that is being used from one that is merely configured.
    double first_share[sizeof(sizes)/sizeof(*sizes)][sizeof(qds)/sizeof(*qds)];

    for (int nc = 1; nc >= 0; nc--) {
        printf("\n== random pread, %s ==\n", nc ? "F_NOCACHE" : "page-cached");
        printf("%-18s", "record");
        for (unsigned q = 0; q < sizeof(qds)/sizeof(*qds); q++) printf("  QD%-2d ", qds[q]);
        printf("   (GB/s)\n");
        for (unsigned s = 0; s < sizeof(sizes)/sizeof(*sizes); s++) {
            printf("%-18s", names[s]);
            for (unsigned q = 0; q < sizeof(qds)/sizeof(*qds); q++) {
                // aim for ~1.5 GB per point for big records, fewer ops for small
                int reads = sizes[s] > 1u<<20 ? 600 : (sizes[s] >= 65536 ? 8000 : 40000);
                reads = (reads / qds[q]) * qds[q];
                if (reads < qds[q]) reads = qds[q];
                double share[MAX_REPLICAS];
                double gbs = run(paths, npaths, sizes[s], qds[q], nc, reads, share);
                if (npaths > 1 && nc) first_share[s][q] = share[0];
                printf(" %5.2f ", gbs);
                fflush(stdout);
            }
            printf("\n");
        }
    }

    if (npaths > 1) {
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
    }

    // latency of a single expert-record read (the decode-path critical number)
    printf("\n== single-read latency (QD1, F_NOCACHE) ==\n");
    for (unsigned s = 0; s < sizeof(sizes)/sizeof(*sizes); s++) {
        int reads = 400;
        double t0 = now();
        // Pinned to the first path: this is a per-read latency, and routing it
        // across disks would average two different latencies into one number.
        double gbs = run(paths, 1, sizes[s], 1, 1, reads, NULL);
        (void)gbs; double dt = now() - t0;
        printf("  %-18s %7.3f ms/read\n", names[s], dt * 1000.0 / reads);
    }
    return 0;
}
