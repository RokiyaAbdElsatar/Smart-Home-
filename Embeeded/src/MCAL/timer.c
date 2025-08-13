#include <avr/io.h>
#include "MCAL/timer.h"

void TIMER0_FastPWM_Init_Noninverting_Prescale64(void)
{
    // WGM00/01 = 1 -> Fast PWM, COM01 = 1 non-inverting, prescaler = 64
    TCCR0 |= (1<<WGM00) | (1<<WGM01);
    TCCR0 |= (1<<COM01);
    TCCR0 |= (1<<CS01) | (1<<CS00);
    OCR0 = 0; // start with 0%
}

void TIMER0_FastPWM_SetDuty(uint8_t duty_percent)
{
    if (duty_percent>100) duty_percent=100;
    OCR0 = (uint8_t)((duty_percent * 255UL)/100UL);
}