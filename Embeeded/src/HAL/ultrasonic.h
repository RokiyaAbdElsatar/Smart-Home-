#ifndef HAL_ULTRASONIC_H_
#define HAL_ULTRASONIC_H_
#include <stdint.h>
void Ultrasonic_Init(void);
uint16_t Ultrasonic_ReadDistance(void); // in cm
#endif