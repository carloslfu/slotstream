#include "slotpack.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <fenv.h>
static uint32_t seed=0x534c4f54;
static uint32_t rnd(void){seed^=seed<<13;seed^=seed>>17;seed^=seed<<5;return seed;}
static float bf(uint16_t w){uint32_t u=(uint32_t)w<<16;float f;memcpy(&f,&u,4);return f;}
static uint16_t prediction(uint16_t s,uint8_t c){float p=-bf(s)*(float)c;uint32_t u;memcpy(&u,&p,4);return (uint16_t)((u+0x7fff+((u>>16)&1))>>16);}
int main(void){
    fesetround(FE_TONEAREST);size_t predictions=0,centers=0,roundtrips=0,mutations=0;
    for(unsigned s=0;s<65536;s++)if((s&0x7f80)!=0x7f80)for(unsigned c=0;c<256;c++){
        if(slotpack_predict_bias((uint16_t)s,(uint8_t)c)!=prediction((uint16_t)s,(uint8_t)c)){fprintf(stderr,"prediction %x %u\n",s,c);return 1;}predictions++;
    }
    for(unsigned i=0;i<1000000;i++){
        uint16_t s=(uint16_t)rnd(),b=(uint16_t)rnd();double v=-((double)bf(b))/bf(s);uint8_t expected=0;
        if(isfinite(bf(s)) && isfinite(bf(b)) && bf(s)!=0 && isfinite(v)){if(v>=255)expected=255;else if(v>0)expected=(uint8_t)nearbyint(v);}
        if(slotpack_center(s,b)!=expected){fprintf(stderr,"center %x %x %u %u\n",s,b,slotpack_center(s,b),expected);return 1;}centers++;
    }
    size_t cap=1024*1024;uint8_t *src=malloc(cap),*enc=malloc(cap+32),*out=malloc(cap),*bad=malloc(cap+32);
    if(!src || !enc || !out || !bad)return 2;
    for(unsigned mode=0;mode<3;mode++)for(unsigned k=0;k<20;k++){
        size_t n=mode==2?(size_t)(k+1)*36*64:(size_t)(k+1)*1024;size_t weights=mode==2?n/36*32:0;
        for(size_t i=0;i<n;i++)src[i]=k%3==0?0:k%3==1?(uint8_t)(i%16):(uint8_t)rnd();
        int64_t z=slotpack_encode(src,n,mode,weights,64,enc,cap+32);if(z<0 || slotpack_decode(enc,(size_t)z,out,n) || memcmp(src,out,n)){fprintf(stderr,"roundtrip %u %u\n",mode,k);return 1;}roundtrips++;
        for(size_t cut=0;cut<(size_t)z;cut+=1+(size_t)z/200){if(slotpack_decode(enc,cut,out,n)==0){fprintf(stderr,"truncation accepted\n");return 1;}mutations++;}
        for(unsigned i=0;i<500;i++){
            memcpy(bad,enc,(size_t)z);size_t at=rnd()%(size_t)z;bad[at]^=(uint8_t)(1u<<(rnd()%8));
            /* Mutations may remain a valid codeword; outer SHA-256 rejects them. */
            (void)slotpack_decode(bad,(size_t)z,out,n);mutations++;
        }
        if(slotpack_decode(enc,(size_t)z,out,n+1)==0)return 1;
    }
    free(src);free(enc);free(out);free(bad);
    printf("{\"bf16_predictions\":%zu,\"centers\":%zu,\"roundtrips\":%zu,\"malformed_inputs\":%zu,\"pass\":true}\n",predictions,centers,roundtrips,mutations);
    return 0;
}
