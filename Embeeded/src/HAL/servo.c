#include <util/delay.h>
#include "HAL/servo.h"

void SERVO_Init(void)
{
    GPIO_SetPinDirection(SERVO_PORT, SERVO_PIN, GPIO_OUTPUT);
}

void SERVO_SetAngle(uint8_t angle_deg)
{
    // 1ms..2ms pulse within 20ms period
    uint16_t pulse_us = 1000 + ((uint16_t)angle_deg * 1000U) / 180U;
    for (uint8_t i=0; i<50; ++i) {
        GPIO_WritePin(SERVO_PORT, SERVO_PIN, GPIO_HIGH);
        _delay_us(pulse_us);
        GPIO_WritePin(SERVO_PORT, SERVO_PIN, GPIO_LOW);
        _delay_ms(20 - (pulse_us/1000));
    }
}