#include <stdint.h>
#include "APP/motor_control.h"
#include "HAL/motor_pwm.h"
#include "MCAL/gpio.h"
#include "config/motor_config.h"

void Motor_Control_Init(void)
{
    // PWM pin as output
    GPIO_SetPinDirection(MOTOR_PWM_PORT, MOTOR_PWM_PIN, GPIO_OUTPUT);
    MOTOR_PWM_Init();

    // Buttons with pull-ups
    GPIO_SetPinDirection(BTN1_PORT, BTN1_PIN, GPIO_INPUT);
    GPIO_SetPinDirection(BTN2_PORT, BTN2_PIN, GPIO_INPUT);
    GPIO_SetPinDirection(BTN3_PORT, BTN3_PIN, GPIO_INPUT);

    GPIO_WritePin(BTN1_PORT, BTN1_PIN, GPIO_HIGH);
    GPIO_WritePin(BTN2_PORT, BTN2_PIN, GPIO_HIGH);
    GPIO_WritePin(BTN3_PORT, BTN3_PIN, GPIO_HIGH);
}

void Motor_Control_Run(void)
{
    uint8_t b1, b2, b3;
    GPIO_ReadPin(BTN1_PORT, BTN1_PIN, &b1);
    GPIO_ReadPin(BTN2_PORT, BTN2_PIN, &b2);
    GPIO_ReadPin(BTN3_PORT, BTN3_PIN, &b3);

    if (b1 == GPIO_LOW)
        MOTOR_PWM_SetDuty(MOTOR_SPEED_LOW);
    else if (b2 == GPIO_LOW)
        MOTOR_PWM_SetDuty(MOTOR_SPEED_MED);
    else if (b3 == GPIO_LOW)
        MOTOR_PWM_SetDuty(0);
}