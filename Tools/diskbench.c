// diskbench — measures the exact IO pattern slotstream depends on:
// random preads of expert-record size (2.7648 MB) and ngram-page size (4-16 KiB),
// across queue depths, with and without F_NOCACHE.
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

typedef struct {
    int fd; size_t fsize; size_t rsize; int nreads; unsigned seed;
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
        ssize_t got = pread(j->fd, j->buf, j->rsize, off);
        if (got < 0) { perror("pread"); exit(1); }
        j->bytes += got;
    }
    return NULL;
}

static double run(const char *path, size_t rsize, int qd, int nocache, int total_reads) {
    int fd = open(path, O_RDONLY);
    if (fd < 0) { perror("open"); exit(1); }
    if (nocache) fcntl(fd, F_NOCACHE, 1);
    fcntl(fd, F_RDAHEAD, 0);
    struct stat st; fstat(fd, &st);

    pthread_t th[64]; job_t jobs[64];
    if (qd > 64) qd = 64;
    for (int i = 0; i < qd; i++) {
        jobs[i].fd = fd; jobs[i].fsize = st.st_size; jobs[i].rsize = rsize;
        jobs[i].nreads = total_reads / qd; jobs[i].seed = 1234567u + i * 7919u;
        jobs[i].bytes = 0;
        if (posix_memalign(&jobs[i].buf, 16384, rsize)) { perror("memalign"); exit(1); }
    }
    double t0 = now();
    for (int i = 0; i < qd; i++) pthread_create(&th[i], NULL, worker, &jobs[i]);
    double bytes = 0;
    for (int i = 0; i < qd; i++) { pthread_join(th[i], NULL); bytes += jobs[i].bytes; free(jobs[i].buf); }
    double dt = now() - t0;
    close(fd);
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
    if (argc < 2) { fprintf(stderr, "usage: diskbench <testfile>\n"); return 1; }
    const char *path = argv[1];
    struct stat st;
    if (stat(path, &st)) { perror("stat"); return 1; }
    printf("file: %s (%.1f GB)\n", path, st.st_size / 1e9);
    printf("page size: %d\n\n", getpagesize());

    printf("== sequential ==\n");
    printf("  1 MiB reads, F_NOCACHE : %6.2f GB/s\n", run_seq(path, 1u << 20, 1, 4ull << 30));
    printf("  1 MiB reads, cached    : %6.2f GB/s\n", run_seq(path, 1u << 20, 0, 4ull << 30));

    size_t sizes[] = { 2764800, 2768896, 4096, 16384, 65536, 1u << 20 };
    const char *names[] = { "expert 2.7648MB", "expert pad 16K", "4 KiB", "16 KiB", "64 KiB", "1 MiB" };
    int qds[] = { 1, 2, 4, 8, 16, 32 };

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
                double gbs = run(path, sizes[s], qds[q], nc, reads);
                printf(" %5.2f ", gbs);
                fflush(stdout);
            }
            printf("\n");
        }
    }

    // latency of a single expert-record read (the decode-path critical number)
    printf("\n== single-read latency (QD1, F_NOCACHE) ==\n");
    for (unsigned s = 0; s < sizeof(sizes)/sizeof(*sizes); s++) {
        int reads = 400;
        double t0 = now();
        double gbs = run(path, sizes[s], 1, 1, reads);
        (void)gbs; double dt = now() - t0;
        printf("  %-18s %7.3f ms/read\n", names[s], dt * 1000.0 / reads);
    }
    return 0;
}
