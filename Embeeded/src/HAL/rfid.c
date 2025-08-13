#include "HAL/rfid.h"
#include "RFID_interface.h"
void RFID_Init(void){ RFID_voidInit(); }
uint8_t RFID_IsCardPresent(void){ return RFID_u8IsCardPresent(); }
uint8_t RFID_ReadCard(RFID_Card_t *card){ return RFID_u8ReadCard(card); }
