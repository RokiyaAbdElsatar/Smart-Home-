#ifndef HAL_RFID_H_
#define HAL_RFID_H_
#include <stdint.h>
#define RFID_UID_SIZE 4

typedef struct { uint8_t uid[RFID_UID_SIZE]; } RFID_Card_t;

void RFID_Init(void);
uint8_t RFID_IsCardPresent(void);
uint8_t RFID_ReadCard(RFID_Card_t *card);
#endif