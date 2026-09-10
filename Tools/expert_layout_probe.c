// Bounded, actual-offset layout experiment. No model or GPU allocations.
// Reference mirrors ExpertStore's per-piece pool lanes and longest-first
// sweep jobs. Packed includes conversion back to nine contiguous columns.
#include <CommonCrypto/CommonDigest.h>
#include <dispatch/dispatch.h>
#include <errno.h>
#include <fcntl.h>
#include <libproc.h>
#include <mach/mach.h>
#include <pthread.h>
#include <stdatomic.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/resource.h>
#include <sys/stat.h>
#include <time.h>
#include <unistd.h>

#define PIECES 9
#define LAYERS 4
#define EXPERTS 512
#define MAX_ROWS 32
#define RECORD_BYTES 2764800
typedef struct { int fd; off_t offset; size_t row; } ref_t;
typedef struct { int piece, row, length; size_t bytes; } job_t;
typedef struct {
    ref_t *refs; int packed, mode, sweep, n, lanes, njobs, next;
    off_t packed_base; int *ids; void **out; job_t jobs[PIECES*MAX_ROWS];
    const unsigned char *digests;
    pthread_mutex_t lock; _Atomic int error; _Atomic long calls;
} batch_t;
static double now(void) {
    struct timespec t; clock_gettime(CLOCK_MONOTONIC, &t);
    return t.tv_sec + t.tv_nsec / 1e9;
}
static void die(const char *s) { fprintf(stderr, "%s: %s\n", s, strerror(errno)); exit(2); }
static _Atomic uint64_t sampled_peak=0;
static _Atomic int sampling_stop=0, sampling_error=0;
static void sample_memory(void) {
    struct task_vm_info info; mach_msg_type_number_t cnt=TASK_VM_INFO_COUNT;
    if(task_info(mach_task_self(),TASK_VM_INFO,(task_info_t)&info,&cnt)!=KERN_SUCCESS) {
        atomic_store(&sampling_error,1); return;
    }
    uint64_t prior=atomic_load(&sampled_peak);
    while(prior<info.phys_footprint && !atomic_compare_exchange_weak(&sampled_peak,&prior,info.phys_footprint)) {}
}
static void *sample_loop(void *unused) {
    (void)unused;
    do { sample_memory(); usleep(20000); } while(!atomic_load(&sampling_stop));
    sample_memory(); return NULL;
}
static void *aligned(size_t bytes) {
    void *p = NULL; int e = posix_memalign(&p,16384,bytes);
    if(e) { errno=e; die("allocation"); } return p;
}
static int exact(batch_t *b, int fd, void *dst, size_t bytes, off_t offset) {
    size_t done=0;
    while(done<bytes) {
        if(atomic_load(&b->error)) return 0;
        ssize_t n=pread(fd,(char*)dst+done,bytes-done,offset+done);
        atomic_fetch_add(&b->calls,1);
        if(n<0 && errno==EINTR) continue;
        if(n<=0) { atomic_store(&b->error,n==0?ENODATA:errno); return 0; }
        done+=(size_t)n;
    }
    return 1;
}
static void work(void *context,size_t lane) {
    batch_t *b=context;
    size_t largest=0;
    for(int j=0;j<b->njobs;j++) if(b->jobs[j].bytes>largest) largest=b->jobs[j].bytes;
    void *scratch=b->mode?aligned(largest):NULL;
    int cursor=(int)lane;
    while(!atomic_load(&b->error)) {
        int j=cursor;
        if(b->sweep) { pthread_mutex_lock(&b->lock); j=b->next++; pthread_mutex_unlock(&b->lock); }
        else cursor+=b->lanes;
        if(j>=b->njobs) break;
        job_t job=b->jobs[j];
        if(!b->mode) {
            ref_t ref=b->refs[job.piece];
            if(!exact(b,ref.fd,(char*)b->out[job.piece]+job.row*ref.row,
                job.bytes,ref.offset+(off_t)b->ids[job.row]*ref.row)) break;
        } else {
            if(!exact(b,b->packed,scratch,job.bytes,
                b->packed_base+(off_t)b->ids[job.row]*RECORD_BYTES)) break;
            for(int row=0;row<job.length;row++) {
                if(b->mode==2) {
                    unsigned char hash[CC_SHA256_DIGEST_LENGTH];
                    CC_SHA256((char*)scratch+row*RECORD_BYTES,RECORD_BYTES,hash);
                    if(memcmp(hash,b->digests+b->ids[job.row+row]*CC_SHA256_DIGEST_LENGTH,CC_SHA256_DIGEST_LENGTH)) {
                        atomic_store(&b->error,EBADMSG); break;
                    }
                }
                size_t offset=0;
                for(int p=0;p<PIECES;p++) {
                    size_t bytes=b->refs[p].row;
                    memcpy((char*)b->out[p]+(job.row+row)*bytes,
                        (char*)scratch+row*RECORD_BYTES+offset,bytes);
                    offset+=bytes;
                }
            }
        }
    }
    free(scratch);
}
static int largest_first(const void *a,const void *b) {
    size_t x=((const job_t*)a)->bytes,y=((const job_t*)b)->bytes;
    return (x<y)-(x>y);
}
static int ascending(const void *a,const void *b) { return *(const int*)a-*(const int*)b; }
static int by_time(const void *a,const void *b) {
    double x=*(const double*)a,y=*(const double*)b; return (x>y)-(x<y);
}
static void line(FILE *f,char *out,size_t cap) {
    if(!fgets(out,(int)cap,f)) { errno=EINVAL; die("manifest line"); }
    size_t n=strlen(out);
    if(!n||out[n-1]!='\n') { errno=EINVAL; die("manifest line length"); }
    out[n-1]=0;
}
static int open_data(const char *path) {
    int fd=open(path,O_RDONLY|O_NOFOLLOW);
    if(fd<0) die("open");
    if(fcntl(fd,F_NOCACHE,1)<0||fcntl(fd,F_RDAHEAD,0)<0) die("uncached I/O");
    return fd;
}
static void warm(void *unused,size_t lane) { (void)unused; (void)lane; }
int main(int argc,char **argv) {
    if(argc==2 && !strcmp(argv[1],"--io-constants")) {
        printf("{\"no_cache\":%d,\"no_cache_ext\":%d,\"read_ahead\":%d}\n",F_NOCACHE,F_NOCACHE_EXT,F_RDAHEAD);
        return 0;
    }
    if(argc!=4||strlen(argv[2])!=1||strlen(argv[3])!=1||argv[2][0]<'0'||argv[2][0]>'2'
        ||argv[3][0]<'0'||argv[3][0]>'5') {
        fprintf(stderr,"usage: probe manifest mode(0=pieces,1=packed,2=verified-packed) workload(0..5)\n"); return 2;
    }
    int mode=argv[2][0]-'0', workload=argv[3][0]-'0';
    FILE *file=fopen(argv[1],"r"); if(!file) die("manifest");
    char path[4096]; line(file,path,sizeof(path));
    int version=!strcmp(path,"SSLP2")?2:!strcmp(path,"SSLP1")?1:0;
    if(!version || (mode==2 && version!=2)) { errno=EINVAL; die("manifest version"); }
    line(file,path,sizeof(path)); int packed=open_data(path);
    struct stat st; if(fstat(packed,&st)||st.st_size!=(off_t)LAYERS*EXPERTS*RECORD_BYTES) {
        errno=EINVAL; die("packed length");
    }
    unsigned char digests[LAYERS*EXPERTS*CC_SHA256_DIGEST_LENGTH];
    if(version==2) {
        line(file,path,sizeof(path)); FILE *hashes=fopen(path,"rb");
        if(!hashes) die("record digests");
        if(fread(digests,1,sizeof(digests),hashes)!=sizeof(digests)||fgetc(hashes)!=EOF) {
            errno=EINVAL; die("record digests length");
        }
        fclose(hashes);
    }
    ref_t refs[LAYERS][PIECES];
    for(int l=0;l<LAYERS;l++) {
        size_t total=0;
        for(int p=0;p<PIECES;p++) {
            line(file,path,sizeof(path)); refs[l][p].fd=open_data(path);
            line(file,path,sizeof(path)); long long offset; unsigned long row; char extra;
            if(sscanf(path,"%lld %lu %c",&offset,&row,&extra)!=2||offset<0
                ||row!=(p%3==0?819200:51200)) { errno=EINVAL; die("tensor geometry"); }
            if(fstat(refs[l][p].fd,&st)||offset>st.st_size
                ||(off_t)row*EXPERTS>st.st_size-offset) { errno=EINVAL; die("tensor range"); }
            refs[l][p].offset=offset; refs[l][p].row=row; total+=row;
        }
        if(total!=RECORD_BYTES) { errno=EINVAL; die("record geometry"); }
    }
    if(fgetc(file)!=EOF) { errno=EINVAL; die("manifest trailing data"); } fclose(file);
    int sizes[]={1,4,10,32,32,32}; int batchsize=sizes[workload],sweep=workload>=4;
    dispatch_queue_t queue=dispatch_get_global_queue(QOS_CLASS_USER_INITIATED,0);
    dispatch_apply_f(32,queue,NULL,warm);
    struct rusage_info_v4 io_before={0},io_after={0};
    if(proc_pid_rusage(getpid(),RUSAGE_INFO_V4,(rusage_info_t*)&io_before)) die("disk I/O observation");
    CC_SHA256_CTX checksum; CC_SHA256_Init(&checksum);
    double seconds=0,times[LAYERS*EXPERTS]; int batches=0,records=0; long calls=0;
    size_t max_owned=0; pthread_t sampler;
    int launch=pthread_create(&sampler,NULL,sample_loop,NULL);
    if(launch) { errno=launch; die("memory sampler"); }
    for(int l=0;l<LAYERS;l++) {
        int ids[EXPERTS]; for(int i=0;i<EXPERTS;i++) ids[i]=i;
        uint32_t rng=0x91e10da5U+(uint32_t)l;
        if(workload!=4) {
            for(int i=EXPERTS-1;i>0;i--) {
                rng^=rng<<13; rng^=rng>>17; rng^=rng<<5;
                int j=(int)(rng%(uint32_t)(i+1)),temp=ids[i]; ids[i]=ids[j];ids[j]=temp;
            }
        }
        int count=workload==5?256:EXPERTS;
        if(sweep) qsort(ids,count,sizeof(int),ascending);
        for(int start=0;start<count;start+=batchsize) {
            int n=count-start<batchsize?count-start:batchsize;
            double t=now(); void *out[PIECES];
            for(int p=0;p<PIECES;p++) out[p]=aligned((size_t)n*refs[l][p].row);
            batch_t b={.refs=refs[l],.packed=packed,.mode=mode,.sweep=sweep,
                .n=n,.packed_base=(off_t)l*EXPERTS*RECORD_BYTES,.ids=ids+start,.out=out,
                .digests=digests+l*EXPERTS*CC_SHA256_DIGEST_LENGTH,
                .lock=PTHREAD_MUTEX_INITIALIZER,.error=0,.calls=0};
            for(int row=0;row<n;) {
                int len=1;
                if(sweep) while(row+len<n && b.ids[row+len]==b.ids[row]+len) len++;
                if(mode) b.jobs[b.njobs++]=(job_t){0,row,len,(size_t)len*RECORD_BYTES};
                else for(int p=0;p<PIECES;p++)
                    b.jobs[b.njobs++]=(job_t){p,row,len,(size_t)len*refs[l][p].row};
                row+=len;
            }
            if(sweep) qsort(b.jobs,b.njobs,sizeof(job_t),largest_first);
            b.lanes=sweep?12:32; if(b.lanes>b.njobs) b.lanes=b.njobs;
            dispatch_apply_f((size_t)b.lanes,queue,&b,work);
            pthread_mutex_destroy(&b.lock);
            double elapsed=now()-t;
            int error=atomic_load(&b.error); if(error) { errno=error; die("batch read"); }
            calls+=atomic_load(&b.calls);
            // Hash every returned tensor byte outside the measured region.
            // Both paths produce exactly the same column ordering.
            for(int p=0;p<PIECES;p++) CC_SHA256_Update(&checksum,out[p],(CC_LONG)((size_t)n*refs[l][p].row));
            sample_memory();
            size_t scratch=0; if(mode) for(int j=0;j<b.njobs;j++) if(b.jobs[j].bytes>scratch) scratch=b.jobs[j].bytes;
            size_t owned=(size_t)n*RECORD_BYTES+scratch*(size_t)b.lanes;
            if(owned>max_owned) max_owned=owned;
            t=now(); for(int p=0;p<PIECES;p++) free(out[p]); elapsed+=now()-t;
            times[batches++]=elapsed; seconds+=elapsed; records+=n;
        }
    }
    atomic_store(&sampling_stop,1); pthread_join(sampler,NULL);
    if(proc_pid_rusage(getpid(),RUSAGE_INFO_V4,(rusage_info_t*)&io_after)) die("disk I/O observation");
    if(atomic_load(&sampling_error)) { errno=EIO; die("footprint sampler"); }
    struct rusage usage; if(getrusage(RUSAGE_SELF,&usage)) die("RSS observation");
    unsigned char hash[CC_SHA256_DIGEST_LENGTH]; CC_SHA256_Final(hash,&checksum);
    qsort(times,batches,sizeof(double),by_time);
    printf("{\"mode\":%d,\"workload\":%d,\"records\":%d,\"batches\":%d,\"bytes\":%lld,"
        "\"read_calls\":%ld,\"seconds\":%.9f,\"batch_median_seconds\":%.9f,"
        "\"batch_p95_seconds\":%.9f,\"sampled_footprint_bytes\":%llu,\"lifetime_rss_peak_bytes\":%ld,"
        "\"sampling_interval_ms\":20,\"maximum_owned_buffer_bytes\":%zu,"
        "\"diskio_bytesread\":%llu,\"reformat_bytes\":%lld,\"tensor_sha256\":\"",
        mode,workload,records,batches,(long long)records*RECORD_BYTES,calls,seconds,
        times[batches/2],times[(batches-1)*95/100],(unsigned long long)atomic_load(&sampled_peak),usage.ru_maxrss,max_owned,
        (unsigned long long)(io_after.ri_diskio_bytesread-io_before.ri_diskio_bytesread),
        mode?(long long)records*RECORD_BYTES:0);
    for(int i=0;i<CC_SHA256_DIGEST_LENGTH;i++) printf("%02x",hash[i]); puts("\"}");
    for(int l=0;l<LAYERS;l++) for(int p=0;p<PIECES;p++) close(refs[l][p].fd);
    close(packed); return 0;
}
