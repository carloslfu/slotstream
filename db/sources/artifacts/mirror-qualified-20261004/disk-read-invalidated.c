// Task evidence only: read existing model shards; never create or modify payloads.
// cc -O2 -Wall -Wextra -pthread disk-read.c -o disk-read
#define _DARWIN_C_SOURCE
#include <errno.h>
#include <fcntl.h>
#include <pthread.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <time.h>
#include <unistd.h>

enum { RECORD = 2764800, READS = 2400 };
typedef struct { int fd, count; uint32_t seed; uint64_t records, bytes; void *buf; } Job;
static pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;
static pthread_cond_t ready = PTHREAD_COND_INITIALIZER;
static int started;
static void fail(const char *msg) { perror(msg); exit(1); }
static double now(void) {
    struct timespec t;
    if (clock_gettime(CLOCK_MONOTONIC, &t)) fail("clock_gettime");
    return t.tv_sec + t.tv_nsec / 1e9;
}
static void *worker(void *arg) {
    Job *j = arg;
    if (pthread_mutex_lock(&lock)) exit(2);
    while (!started) if (pthread_cond_wait(&ready, &lock)) exit(2);
    if (pthread_mutex_unlock(&lock)) exit(2);
    for (int i=0; i<j->count; i++) {
        j->seed = j->seed * 1103515245u + 12345u;
        off_t offset = (off_t)((j->seed >> 8) % j->records) * RECORD;
        ssize_t n;
        do { n = pread(j->fd, j->buf, RECORD, offset); } while (n < 0 && errno == EINTR);
        if (n < 0) fail("pread");
        if (n != RECORD) { fprintf(stderr, "short pread: %zd/%d\n", n, RECORD); exit(3); }
        j->bytes += n;
    }
    return NULL;
}
int main(int argc, char **argv) {
    if (argc != 4) { fprintf(stderr, "usage: disk-read file queue-depth round\n"); return 2; }
    int qd = atoi(argv[2]), round = atoi(argv[3]);
    if (qd < 1 || qd > 32 || READS % qd || round < 1 || round > 3) return 2;
    int fd = open(argv[1], O_RDONLY);
    if (fd < 0) fail("open");
    if (fcntl(fd, F_NOCACHE, 1) < 0) fail("F_NOCACHE");
    if (fcntl(fd, F_RDAHEAD, 0) < 0) fail("F_RDAHEAD");
    struct stat st;
    if (fstat(fd, &st)) fail("fstat");
    if (!S_ISREG(st.st_mode) || st.st_size < RECORD) return 2;
    // Invalidate cached pages of this read-only mapping before the timed reads.
    void *mapping = mmap(NULL, (size_t)st.st_size, PROT_READ, MAP_SHARED, fd, 0);
    if (mapping == MAP_FAILED) fail("mmap");
    if (msync(mapping, (size_t)st.st_size, MS_INVALIDATE)) fail("MS_INVALIDATE");
    if (munmap(mapping, (size_t)st.st_size)) fail("munmap");
    struct stat after;
    if (fstat(fd, &after)) fail("fstat after invalidation");
    if (after.st_size != st.st_size || after.st_ino != st.st_ino || after.st_flags != st.st_flags ||
        after.st_mtimespec.tv_sec != st.st_mtimespec.tv_sec || after.st_mtimespec.tv_nsec != st.st_mtimespec.tv_nsec) {
        fprintf(stderr, "read-only invalidation changed source metadata\n"); return 4;
    }
    Job jobs[32]; pthread_t threads[32];
    for (int i=0; i<qd; i++) {
        jobs[i]=(Job){.fd=fd, .count=READS/qd, .seed=1234567u+i*7919u+round*104729u,
                      .records=(uint64_t)st.st_size/RECORD, .bytes=0};
        if (posix_memalign(&jobs[i].buf, 16384, RECORD)) exit(2);
        if (pthread_create(&threads[i], NULL, worker, &jobs[i])) exit(2);
    }
    double t = now();
    if (pthread_mutex_lock(&lock)) exit(2);
    started=1;
    if (pthread_cond_broadcast(&ready) || pthread_mutex_unlock(&lock)) exit(2);
    uint64_t bytes=0;
    for (int i=0; i<qd; i++) {
        if (pthread_join(threads[i], NULL)) exit(2);
        bytes += jobs[i].bytes; free(jobs[i].buf);
    }
    double seconds=now()-t;
    if (bytes != (uint64_t)RECORD*READS || seconds <= 0) return 3;
    printf("{\"round\":%d,\"qd\":%d,\"record_bytes\":%d,\"reads\":%d,\"bytes\":%llu,\"seconds\":%.9f,\"GB_per_second\":%.9f,\"file_bytes\":%lld,\"device\":%d,\"inode\":%llu,\"nocache\":true,\"readahead\":false}\n",
           round, qd, RECORD, READS, (unsigned long long)bytes, seconds, bytes/seconds/1e9,
           (long long)st.st_size, st.st_dev, (unsigned long long)st.st_ino);
    if (close(fd)) fail("close");
    return 0;
}
