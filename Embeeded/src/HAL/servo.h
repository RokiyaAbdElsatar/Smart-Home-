#ifndef HAL_SERVO_H_
#define HAL_SERVO_H_
#include <stdint.h>
#include "MCAL/gpio.h"
#ifndef SERVO_PORT
#define SERVO_PORT GPIO_PORTD
#endif
#ifndef SERVO_PIN
#define SERVO_PIN  5
#endif
void SERVO_Init(void);
void SERVO_SetAngle(uint8_t angle_deg);
#endif