#include <util/delay.h>
#include "HAL/buzzer.h"

void BUZZER_Init(void)
{
    GPIO_SetPinDirection(BUZZER_PORT, BUZZER_PIN, GPIO_OUTPUT);
    GPIO_WritePin(BUZZER_PORT, BUZZER_PIN, GPIO_LOW);
}

void BUZZER_BeepSeconds(uint8_t seconds)
{
    for (uint8_t i = 0; i < seconds * 2; ++i)
    {
        GPIO_TogglePin(BUZZER_PORT, BUZZER_PIN);
        _delay_ms(500);
    }
    GPIO_WritePin(BUZZER_PORT, BUZZER_PIN, GPIO_LOW);
}