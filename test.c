#include <stdlib.h>
#include <stdio.h>
#define HELLO 1+3
#define SRAM __attribute__((section(".sram")))

extern uint32_t _load_sram_funcs;
extern uint32_t _start_sram_funcs;
extern const uint32_t _end_sram_funcs;

SRAM int sram_func(int t){
	
	return t + 1;
}
static inline void copy_sram_funcs(void)
{
    const uint32_t *src;
    volatile uint32_t *dst;

    for (src = &_load_sram_funcs, dst = &_start_sram_funcs; dst < &_end_sram_funcs; ) {
        *dst++ = *src++;
    }
}
int main(){
	int test = 0x1;

	copy_sram_funcs();

	return HELLO;
	
}
