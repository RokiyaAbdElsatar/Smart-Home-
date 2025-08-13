#ifndef LIGHT_CONTROL_H_
#define LIGHT_CONTROL_H_

#include <Arduino.h>

void Light_Init(uint8_t pin);
void Light_SetState(uint8_t pin, bool state);

#endif
