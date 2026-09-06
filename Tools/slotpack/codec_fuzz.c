#include "slotpack.h"
#include <stdint.h>
#include <stdlib.h>
#include <stddef.h>
int LLVMFuzzerTestOneInput(const uint8_t *data,size_t size) {
    if(size<12)return 0;
    size_t raw=(size_t)data[8]|(size_t)data[9]<<8|(size_t)data[10]<<16|(size_t)data[11]<<24;
    if(!raw || raw>1024*1024)return 0;
    uint8_t *out=malloc(raw);
    if(out){(void)slotpack_decode(data,size,out,raw);free(out);}
    return 0;
}
