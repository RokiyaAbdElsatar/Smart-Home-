#include "bluetooth.h"

static BluetoothSerial SerialBT;

void BT_Init(const char *name) {
    SerialBT.begin(name);
}

bool BT_Available(void) {
    return SerialBT.available();
}

String BT_ReadString(void) {
    return SerialBT.readStringUntil('\n');
}

void BT_SendString(const String &msg) {
    SerialBT.println(msg);
}
