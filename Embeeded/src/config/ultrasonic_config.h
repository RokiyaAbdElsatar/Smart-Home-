#ifndef CONFIG_ULTRASONIC_CONFIG_H_
#define CONFIG_ULTRASONIC_CONFIG_H_
#include "MCAL/gpio.h"

// Light output (room lamp)
#define LIGHT_PORT  GPIO_PORTB
#define LIGHT_PIN   1

// Zones (cm)
#define ZONE_A_MIN_CM 5
#define ZONE_A_MAX_CM 30
#define ZONE_B_MIN_CM 30
#define ZONE_B_MAX_CM 80

#endif