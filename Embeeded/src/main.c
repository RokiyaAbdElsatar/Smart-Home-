#include <util/delay.h>
#include <stdint.h>
#include "APP/rfid_door.h"
#include "APP/motor_control.h"
#include "APP/led_control.h"
#include "APP/people_counter.h"
#include "HAL/lcd.h"

int main(void)
{
    LCD_Init();
    RFID_Door_Init();
    Motor_Control_Init();
    LED_Control_Init();
    People_Counter_Init();

    LCD_Clear();
    LCD_SendString("Door Security");
    LCD_GoToXY(1, 0);
    LCD_SendString("Scan Card...");

    while (1)
    {
        RFID_Door_Run();
        Motor_Control_Run();
        LED_Control_Run();
        People_Counter_Run();
        _delay_ms(20); // cooperative scheduling tick
    }
}
