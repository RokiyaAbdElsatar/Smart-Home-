#include <stdint.h>
#include <stdbool.h>
#include "APP/people_counter.h"
#include "HAL/ultrasonic.h"
#include "MCAL/gpio.h"
#include "config/ultrasonic_config.h"

static uint8_t people = 0;
static uint8_t state = 0; // 0 idle, 1 near->far, 2 far->near

void People_Counter_Init(void)
{
    Ultrasonic_Init();
    GPIO_SetPinDirection(LIGHT_PORT, LIGHT_PIN, GPIO_OUTPUT);
}

void People_Counter_Run(void)
{
    uint16_t distance = Ultrasonic_ReadDistance();

    bool in_zone_a = (distance > ZONE_A_MIN_CM && distance < ZONE_A_MAX_CM);
    bool in_zone_b = (distance >= ZONE_B_MIN_CM && distance < ZONE_B_MAX_CM);

    switch (state)
    {
        case 0:
            if (in_zone_a) state = 1;
            else if (in_zone_b) state = 2;
            break;
        case 1:
            if (in_zone_b)
            {
                if (people < 255) people++;
                state = 0;
                while (Ultrasonic_ReadDistance() < 100) { /* wait exit */ }
            }
            break;
        case 2:
            if (in_zone_a)
            {
                if (people > 0) people--;
                state = 0;
                while (Ultrasonic_ReadDistance() < 100) { /* wait exit */ }
            }
            break;
    }

    if (people > 0) GPIO_WritePin(LIGHT_PORT, LIGHT_PIN, GPIO_HIGH);
    else            GPIO_WritePin(LIGHT_PORT, LIGHT_PIN, GPIO_LOW);
}