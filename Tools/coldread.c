// Strict cold-read test: every offset is read AT MOST ONCE, spread across many
// files totalling far more than RAM, so neither the page cache nor the SSD's own
// DRAM can serve a repeat. This is the honest number for slotstream's IO model.
//
// cc -O2 -o coldread coldread.c -lpthread
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

static double now(void){struct timeval t;gettimeofday(&t,NULL);return t.tv_sec+t.tv_usec/1e6;}

typedef struct { int *fds; off_t *sizes; int nfiles; size_t rsize;
                 long *cursor; pthread_mutex_t *lock; int nreads; double bytes;
                 uint64_t seed; } job_t;

static void *worker(void *p){
    job_t *j=(job_t*)p;
    void *buf; if(posix_memalign(&buf,16384,j->rsize)) return NULL;
    uint64_t s=j->seed;
    for(int i=0;i<j->nreads;i++){
        // distinct offset each time: stride through a shuffled space
        pthread_mutex_lock(j->lock);
        long k=(*j->cursor)++;
        pthread_mutex_unlock(j->lock);
        s = s*6364136223846793005ULL + 1442695040888963407ULL;
        int f = (int)((s>>33) % (uint64_t)j->nfiles);
        long nrec = (long)(j->sizes[f]/j->rsize);
        if(nrec<=0) continue;
        // golden-ratio stride guarantees no repeat until the file is exhausted
        long rec = (long)(((unsigned long)k * 2654435761UL) % (unsigned long)nrec);
        ssize_t got=pread(j->fds[f],buf,j->rsize,(off_t)rec*(off_t)j->rsize);
        if(got>0) j->bytes+=got;
    }
    free(buf); return NULL;
}

int main(int argc,char**argv){
    if(argc<4){fprintf(stderr,"usage: coldread <rsize> <qd> <file...>\n");return 1;}
    size_t rsize=(size_t)atol(argv[1]);
    int qd=atoi(argv[2]);
    int nf=argc-3;
    int *fds=calloc(nf,sizeof(int)); off_t *sz=calloc(nf,sizeof(off_t));
    for(int i=0;i<nf;i++){
        fds[i]=open(argv[3+i],O_RDONLY);
        if(fds[i]<0){perror(argv[3+i]);return 1;}
        fcntl(fds[i],F_NOCACHE,1); fcntl(fds[i],F_RDAHEAD,0);
        struct stat st; fstat(fds[i],&st); sz[i]=st.st_size;
    }
    long cursor=0; pthread_mutex_t lock=PTHREAD_MUTEX_INITIALIZER;
    if(qd>64)qd=64;
    int total = rsize>=1u<<20 ? 3000 : 60000;
    pthread_t th[64]; job_t jobs[64];
    for(int i=0;i<qd;i++){
        jobs[i]=(job_t){fds,sz,nf,rsize,&cursor,&lock,total/qd,0,(uint64_t)(i*7919+13)};
    }
    double t0=now();
    for(int i=0;i<qd;i++) pthread_create(&th[i],NULL,worker,&jobs[i]);
    double bytes=0;
    for(int i=0;i<qd;i++){pthread_join(th[i],NULL);bytes+=jobs[i].bytes;}
    double dt=now()-t0;
    printf("rsize=%-9zu qd=%-3d  %8.2f GB/s  %8.1f kIOPS  %7.1f us/read  (%.2f GB read)\n",
           rsize,qd,bytes/dt/1e9,(total/dt)/1e3,dt*1e6/total,bytes/1e9);
    return 0;
}
