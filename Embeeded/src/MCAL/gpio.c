#include <avr/io.h>
#include "MCAL/gpio.h"

static volatile uint8_t* port_ddr(gpio_port_t p){
    switch(p){
        case GPIO_PORTA: return &DDRA;
        case GPIO_PORTB: return &DDRB;
        case GPIO_PORTC: return &DDRC;
        default: return &DDRD;
    }
}
static volatile uint8_t* port_port(gpio_port_t p){
    switch(p){
        case GPIO_PORTA: return &PORTA;
        case GPIO_PORTB: return &PORTB;
        case GPIO_PORTC: return &PORTC;
        default: return &PORTD;
    }
}
static volatile uint8_t* port_pin(gpio_port_t p){
    switch(p){
        case GPIO_PORTA: return &PINA;
        case GPIO_PORTB: return &PINB;
        case GPIO_PORTC: return &PINC;
        default: return &PIND;
    }
}

void GPIO_SetPinDirection(gpio_port_t port, uint8_t pin, gpio_dir_t dir)
{
    if (dir==GPIO_OUTPUT) *port_ddr(port) |=  (1<<pin);
    else                  *port_ddr(port) &= ~(1<<pin);
}

void GPIO_WritePin(gpio_port_t port, uint8_t pin, gpio_level_t level)
{
    if (level==GPIO_HIGH) *port_port(port) |=  (1<<pin);
    else                  *port_port(port) &= ~(1<<pin);
}

void GPIO_TogglePin(gpio_port_t port, uint8_t pin)
{
    *port_port(port) ^= (1<<pin);
}

void GPIO_ReadPin(gpio_port_t port, uint8_t pin, uint8_t *val)
{
    *val = ((*port_pin(port)) & (1<<pin)) ? 1 : 0;
}