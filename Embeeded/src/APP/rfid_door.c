#include <string.h>
#include <util/delay.h>
#include "APP/rfid_door.h"
#include "HAL/rfid.h"
#include "HAL/servo.h"
#include "HAL/buzzer.h"
#include "HAL/lcd.h"
#include "config/rfid_config.h"

static uint8_t match_uid(const uint8_t uid[RFID_UID_SIZE])
{
    for (uint8_t i = 0; i < AUTH_CARDS_COUNT; ++i)
    {
        if (memcmp(uid, gkAuthorizedCards[i], RFID_UID_SIZE) == 0) return 1;
    }
    return 0;
}

void RFID_Door_Init(void)
{
    RFID_Init();
    SERVO_Init();
    BUZZER_Init();
}

void RFID_Door_Run(void)
{
    RFID_Card_t card;
    if (RFID_IsCardPresent() && RFID_ReadCard(&card))
    {
        LCD_Clear();
        LCD_SendString("Card Detected");

        const uint8_t ok = match_uid(card.uid);
        LCD_GoToXY(1, 0);
        if (ok)
        {
            LCD_SendString("Access Granted");
            SERVO_SetAngle(90);
            _delay_ms(3000);
            SERVO_SetAngle(0);
        }
        else
        {
            LCD_SendString("Access Denied!");
            BUZZER_BeepSeconds(3);
        }

        _delay_ms(1200);
        LCD_Clear();
        LCD_SendString("Door Security");
        LCD_GoToXY(1, 0);
        LCD_SendString("Scan Card...");
    }
}