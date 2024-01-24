#include <stdio.h>
#include <stdint.h>

#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"
#include "sys/alt_stdio.h"
#include "unistd.h"
#include "sys/alt_sys_init.h"
#include "io.h"

#include "sys/alt_irq.h"

#include "altera_avalon_timer.h"
#include "altera_avalon_timer_regs.h"

volatile uint16_t count = 0;

void wr_seg1(uint8_t digit){
    IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, digit);    
};

void wr_seg2(uint8_t digit){
    IOWR_ALTERA_AVALON_PIO_DATA(PIO_2_BASE, digit);   
};

void wr_seg3(uint8_t digit){
    IOWR_ALTERA_AVALON_PIO_DATA(PIO_3_BASE, digit);    
};

void timer_isr(void* context, alt_u32 id) {
    count++;
    if (count == 1000) {
        count = 0;
    }

    wr_seg1(count % 10);
    wr_seg2((count / 10) % 10);
    wr_seg3((count / 100) % 10);

    IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE, 0);
}

int main() {
    
    alt_avalon_timer_sc_init((void*)TIMER_0_BASE, TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID, TIMER_0_IRQ, TIMER_0_FREQ);

    alt_ic_isr_register(TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID, TIMER_0_IRQ, (alt_isr_func)timer_isr, 0, 0);


    
    IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE, ALTERA_AVALON_TIMER_CONTROL_ITO_MSK | ALTERA_AVALON_TIMER_CONTROL_CONT_MSK | ALTERA_AVALON_TIMER_CONTROL_START_MSK);

    while (1) {
        usleep(10000);
    }

    return 0;
}




/*
int main(){
    uint16_t count = 0;

    while (1) {
        wr_seg1(count % 10);
        wr_seg2((count / 10) % 10);
        wr_seg3((count / 100) % 10);
        count++;
        
        if (count == 1000) {
            count = 0;
        }
		usleep(10000); 
		
		
    }
    return 0;
} */
