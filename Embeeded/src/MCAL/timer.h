#ifndef MCAL_TIMER_H_
#define MCAL_TIMER_H_
#include <stdint.h>

// Timer0 Fast-PWM for motor
void TIMER0_FastPWM_Init_Noninverting_Prescale64(void);
void TIMER0_FastPWM_SetDuty(uint8_t duty_percent); // 0..100

#endif