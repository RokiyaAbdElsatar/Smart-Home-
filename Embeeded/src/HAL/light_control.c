#include "light_control.h"

void Light_Init(uint8_t pin) {
    pinMode(pin, OUTPUT);
}

void Light_SetState(uint8_t pin, bool state) {
    digitalWrite(pin, state ? HIGH : LOW);
}
