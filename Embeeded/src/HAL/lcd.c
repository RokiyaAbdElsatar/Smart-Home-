#include "HAL/lcd.h"
#include "LCD_interface.h"
void LCD_Init(void){ LCD_voidInit(); }
void LCD_Clear(void){ LCD_voidClear(); }
void LCD_SendString(const char *s){ LCD_voidSendString((char*)s); }
void LCD_GoToXY(unsigned char r, unsigned char c){ LCD_voidGoToXY(r,c); }
