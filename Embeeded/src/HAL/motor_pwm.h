#ifndef HAL_MOTOR_PWM_H_
#define HAL_MOTOR_PWM_H_
#include <stdint.h>
#include "MCAL/timer.h"
static inline void MOTOR_PWM_Init(void){ TIMER0_FastPWM_Init_Noninverting_Prescale64(); }
static inline void MOTOR_PWM_SetDuty(uint8_t duty){ TIMER0_FastPWM_SetDuty(duty); }
#endif
