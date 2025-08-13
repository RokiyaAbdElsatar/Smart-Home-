#ifndef HAL_BUZZER_H_
#define HAL_BUZZER_H_
#include <stdint.h>
#include "MCAL/gpio.h"
#ifndef BUZZER_PORT
#define BUZZER_PORT GPIO_PORTD
#endif
#ifndef BUZZER_PIN
#define BUZZER_PIN  6
#endif
void BUZZER_Init(void);
void BUZZER_BeepSeconds(uint8_t seconds);
#endif