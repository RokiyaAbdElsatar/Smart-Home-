#include <stdint.h>
#include "APP/led_control.h"
#include "MCAL/gpio.h"
#include "config/motor_config.h" // reuse switch if desired

#ifndef LED_MANUAL_PORT
#define LED_MANUAL_PORT  GPIO_PORTB
#endif
#ifndef LED_MANUAL_PIN
#define LED_MANUAL_PIN   0
#endif
#ifndef LED_SWITCH_PORT
#define LED_SWITCH_PORT  GPIO_PORTD
#endif
#ifndef LED_SWITCH_PIN
#define LED_SWITCH_PIN   0
#endif

void LED_Control_Init(void)
{
    GPIO_SetPinDirection(LED_MANUAL_PORT, LED_MANUAL_PIN, GPIO_OUTPUT);
    GPIO_SetPinDirection(LED_SWITCH_PORT, LED_SWITCH_PIN, GPIO_INPUT);
    GPIO_WritePin(LED_SWITCH_PORT, LED_SWITCH_PIN, GPIO_HIGH); // pull-up
}

void LED_Control_Run(void)
{
    uint8_t sw;
    GPIO_ReadPin(LED_SWITCH_PORT, LED_SWITCH_PIN, &sw);
    GPIO_WritePin(LED_MANUAL_PORT, LED_MANUAL_PIN, (sw == GPIO_LOW) ? GPIO_HIGH : GPIO_LOW);
}
