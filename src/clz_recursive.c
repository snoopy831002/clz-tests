#include "../inc/main.h"
uint32_t count = 16;                                                        
uint32_t mask  = 0xFFFFFFFF;
int result=0;

int clz(uint32_t x) { 
    if(!x) return 32;
    uint16_t upper = (x >> count);
    uint16_t lower = (x & (0xFFFFFFFF>>count));
    if(count==1) return (x>>1)?0:1;
    count >>= 1;
    result =upper ? clz(upper) : (count<<1) + clz(lower);
    count <<= 1;
    return result;
}
