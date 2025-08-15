# Flutter + ESP32 Bluetooth Control

## 1. Project Structure (Flutter)
```

└── lib/
    ├── main.dart                # Entry point of the app   
    ├── views/
    │      ├── dashboard/            
    │      │      ├── UI/
    │      │      |   ├── widgets/                 # all widgets for Dashboard Screen
    │      │      |   └── dashboard screen.dart    # The Dashboard Screen
    │      │      │       
    │      │      └── data/model/                  # all Classes for Dashboard Screen 
    │      │
    │      ├── login/            
    │      │     ├── widgets/                      # all widgets for Login Screen
    │      │      └── login_Screen.dart            # The Login Screen
    │      │                       
    │      └── splash/            
    │            ├── widgets/                      # all widgets for Splash Screen
    │            └── splash.dart                   # The Splash Screen
    │ 
    │ 
    └── core/
         ├── constant/                             # The app color
         ├── embedded/                             # Handles Bluetooth connection and data sending
         └── widgets/                              # The logo widget

```

## 2. Preparing Flutter to Send Commands to ESP32

### Step 1 – Add Dependencies
- Add the required Bluetooth library to `pubspec.yaml` (`flutter_bluetooth_serial`).
- Add `permission_handler` for runtime permissions.

### Step 2 – Request Permissions (Android)
- Add Bluetooth permissions in `AndroidManifest.xml`:

  ```
      <!-- Bluetooth permissions for Android 12 -->

    <uses-permission android:name="android.permission.BLUETOOTH" />
    <uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />

   <!-- Scan the Location permissions -->

    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />

      <!-- Bluetooth permissions for Android 12 an later -->

    <uses-permission android:name="android.permission.BLUETOOTH_SCAN" android:usesPermissionFlags="neverForLocation" />
    <uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
    <uses-permission android:name="android.permission.BLUETOOTH_ADVERTISE" />
  ```


### Step 3 – Create Bluetooth Service
- Inside lib/core/embedded/, create a new file named `bluetooth controls.dart`.

- This file will be responsible for:

  - Connecting to the ESP32 via its MAC address (retrieved from Arduino Serial Monitor).

  - Sending commands ('1' to turn ON, '0' to turn OFF).

  - Handling connection status so it can be reused across multiple screens.

### Step 4 – Integrate with Dashboard
 - In the Dashboard UI (dashboard_screen.dart), import `bluetooth controls.dart`.

 - Add a "Connect" button that calls the connectToESP() function from the service.

 - Add control buttons (e.g., "LED ON", "LED OFF") that use the sendData() function from the service.

 - Keep the service reusable so other smart home controls can use the same Bluetooth connection without reconnecting.


### Step 5 – ESP32 Setup
- Upload ESP32 code to:
  - Initializes Bluetooth with a visible name ("TestESP").
  - Listen for incoming commands.
  - Control LED .

### Step 6 – Testing
- Pair ESP32 with your phone (skip pairing if already done).
- Make sure the Flutter app is running on a real device (Bluetooth doesn’t work on standard emulators).
- Open the Dashboard, click "Connect" to pair with ESP32.
- Test ON/OFF buttons — check Arduino Serial Monitor to see "LED ON" or "LED OFF" messages.
