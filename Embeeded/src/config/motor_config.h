#ifndef CONFIG_MOTOR_CONFIG_H_
#define CONFIG_MOTOR_CONFIG_H_
#include "MCAL/gpio.h"

// OC0 pin (PB3 on ATmega16/32), adjust for your MCU
#define MOTOR_PWM_PORT  GPIO_PORTB
#define MOTOR_PWM_PIN   3

// Buttons PD0, PD1, PD2
#define BTN1_PORT GPIO_PORTD
#define BTN1_PIN  0
#define BTN2_PORT GPIO_PORTD
#define BTN2_PIN  1
#define BTN3_PORT GPIO_PORTD
#define BTN3_PIN  2

// Duty presets (%)
#define MOTOR_SPEED_LOW 30
#define MOTOR_SPEED_MED 60

#endif
