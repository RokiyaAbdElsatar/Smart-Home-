#ifndef BLUETOOTH_H_
#define BLUETOOTH_H_

#include <Arduino.h>
#include "BluetoothSerial.h"

void BT_Init(const char *name);
bool BT_Available(void);
String BT_ReadString(void);
void BT_SendString(const String &msg);

#endif