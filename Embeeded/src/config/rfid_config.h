#ifndef CONFIG_RFID_CONFIG_H_
#define CONFIG_RFID_CONFIG_H_
#include <stdint.h>
#include "HAL/rfid.h"

static const uint8_t gkAuthorizedCards[][RFID_UID_SIZE] = {
    {0x12, 0x34, 0x56, 0x78},
};
#define AUTH_CARDS_COUNT (sizeof(gkAuthorizedCards)/RFID_UID_SIZE)
#endif