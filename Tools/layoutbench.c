// E1: does slotstream's 9-piece expert record cost measurable time against a
// packed one? Reads the REAL shard bytes, never the same offset twice,
// F_NOCACHE, at the real piece sizes. run-length r models the sweep's
// contiguous runs; r=1 models the pool path (decode).
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
#define BIG 819200L
#define SML 51200L
typedef struct { int *fds; off_t *sz; int nf; int mode; int runlen; int nrec;
                 long *cursor; pthread_mutex_t *lk; double bytes; } job_t;
static void *worker(void *p){
    job_t *j=(job_t*)p;
    size_t cap = (size_t)j->runlen * 2764800L;
    void *buf; if(posix_memalign(&buf,16384,cap)) return NULL;
    while(1){
        pthread_mutex_lock(j->lk); long k=(*j->cursor)++; pthread_mutex_unlock(j->lk);
        if(k>=j->nrec) break;
        int f=(int)(((unsigned long)k*2654435761UL)%(unsigned long)j->nf);
        long span=(long)(j->sz[f]/ (cap?cap:1));
        if(span<=0) continue;
        long slot=(long)(((unsigned long)k*40503UL)%(unsigned long)span);
        off_t base=(off_t)slot*(off_t)cap;
        if(j->mode==0){ // packed: one pread per record in the run
            for(int r=0;r<j->runlen;r++){
                ssize_t g=pread(j->fds[f],buf,2764800L,base+(off_t)r*2764800L);
                if(g>0) j->bytes+=g;
            }
        } else if(j->mode==1){ // packed-run: ONE pread for the whole run
            ssize_t g=pread(j->fds[f],buf,cap,base); if(g>0) j->bytes+=g;
        } else { // 9-piece: 3 big + 6 small, each covering the whole run
            off_t o=base;
            for(int p2=0;p2<3;p2++){ ssize_t g=pread(j->fds[f],buf,(size_t)j->runlen*BIG,o); if(g>0) j->bytes+=g; o+=(off_t)j->runlen*BIG; }
            for(int p2=0;p2<6;p2++){ ssize_t g=pread(j->fds[f],buf,(size_t)j->runlen*SML,o); if(g>0) j->bytes+=g; o+=(off_t)j->runlen*SML; }
        }
    }
    free(buf); return NULL;
}
int main(int argc,char**argv){
    if(argc<5){fprintf(stderr,"usage: layoutbench <mode 0=packed-per-rec 1=packed-run 2=9piece> <runlen> <qd> <file...>\n");return 1;}
    int mode=atoi(argv[1]), runlen=atoi(argv[2]), qd=atoi(argv[3]);
    int nf=argc-4; int *fds=calloc(nf,sizeof(int)); off_t *sz=calloc(nf,sizeof(off_t));
    for(int i=0;i<nf;i++){ fds[i]=open(argv[4+i],O_RDONLY); if(fds[i]<0){perror(argv[4+i]);return 1;}
        fcntl(fds[i],F_NOCACHE,1); fcntl(fds[i],F_RDAHEAD,0);
        struct stat st; fstat(fds[i],&st); sz[i]=st.st_size; }
    long cursor=0; pthread_mutex_t lk=PTHREAD_MUTEX_INITIALIZER;
    int nrec = 4000/runlen; if(nrec<200) nrec=200;
    if(qd>64) qd=64;
    pthread_t th[64]; job_t jb[64];
    double t0=now();
    for(int i=0;i<qd;i++){ jb[i]=(job_t){fds,sz,nf,mode,runlen,nrec,&cursor,&lk,0}; pthread_create(&th[i],NULL,worker,&jb[i]); }
    double bytes=0; for(int i=0;i<qd;i++){ pthread_join(th[i],NULL); bytes+=jb[i].bytes; }
    double el=now()-t0;
    const char*mn[]={"packed(1 pread/record)","packed-run(1 pread/run)","9-piece(3 big + 6 small)"};
    printf("%-26s runlen=%-2d qd=%-2d  %6.2f GB/s   %8.1f us/record   (%.2f GB)\n",
        mn[mode],runlen,qd,bytes/el/1e9, el/ (double)(nrec*runlen) *1e6, bytes/1e9);
    return 0;
}
