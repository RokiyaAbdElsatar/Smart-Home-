#ifndef MCAL_GPIO_H_
#define MCAL_GPIO_H_
#include <stdint.h>

typedef enum { GPIO_PORTA=0, GPIO_PORTB, GPIO_PORTC, GPIO_PORTD } gpio_port_t;

typedef enum { GPIO_INPUT=0, GPIO_OUTPUT=1 } gpio_dir_t;

typedef enum { GPIO_LOW=0, GPIO_HIGH=1 } gpio_level_t;

void GPIO_SetPinDirection(gpio_port_t port, uint8_t pin, gpio_dir_t dir);
void GPIO_WritePin(gpio_port_t port, uint8_t pin, gpio_level_t level);
void GPIO_TogglePin(gpio_port_t port, uint8_t pin);
void GPIO_ReadPin(gpio_port_t port, uint8_t pin, uint8_t *val);

#endif