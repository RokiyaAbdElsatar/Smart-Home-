#ifndef MCAL_INTERRUPT_H_
#define MCAL_INTERRUPT_H_
#include <avr/interrupt.h>
#define GLOBAL_INT_ENABLE()  sei()
#define GLOBAL_INT_DISABLE() cli()
#endif