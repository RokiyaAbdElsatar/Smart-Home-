#include "bluetooth.h"
#include "light_control.h"

#define LIVING_ROOM_LIGHT 18

void setup() {
    Serial.begin(115200);
    BT_Init("TestESP");
    Light_Init(LIVING_ROOM_LIGHT);
    Serial.println("Bluetooth ready. Waiting for commands...");
}

void loop() {
    if (BT_Available()) {
        String incoming = BT_ReadString();
        incoming.trim();

        Serial.print("Received: ");
        Serial.println(incoming);

        int separatorIndex = incoming.indexOf(':');
        if (separatorIndex == -1) {
            Serial.println("Invalid format, expected 'type:state'");
            return;
        }

        String type = incoming.substring(0, separatorIndex);
        String state = incoming.substring(separatorIndex + 1);

        if (type == "living_room_light") {
            Light_SetState(LIVING_ROOM_LIGHT, state == "1");
            Serial.println(state == "1" ? "LED ON" : "LED OFF");
        } else {
            Serial.println("Unknown device type");
        }
    }
    delay(10);
}
