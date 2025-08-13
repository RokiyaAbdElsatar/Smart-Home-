#ifndef HAL_LCD_H_
#define HAL_LCD_H_
void LCD_Init(void);
void LCD_Clear(void);
void LCD_SendString(const char *s);
void LCD_GoToXY(unsigned char row, unsigned char col);

// legacy compat
#define LCD_voidInit      LCD_Init
#define LCD_voidClear     LCD_Clear
#define LCD_voidSendString LCD_SendString
#define LCD_voidGoToXY    LCD_GoToXY
#endif