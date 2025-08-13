#include "HAL/ultrasonic.h"
#include "Ultrasonic_interface.h"
void Ultrasonic_Init(void){ Ultrasonic_voidInit(); }
uint16_t Ultrasonic_ReadDistance(void){ return Ultrasonic_u16ReadDistance(); }
