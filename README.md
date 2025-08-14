
# 🔐 Smart Home Control with ESP32 & Flutter App

## 📝 Description
This project brings smart home automation to life using **ESP32**, **AVR microcontrollers**, and **Arduino** for robust device control, paired with a **Flutter mobile app** for seamless user interaction. Control home devices like lights via Bluetooth, with the ESP32 and AVR handling commands from the app, enhanced by Arduino's reliable programming environment. Features include RFID door access, room occupancy detection, and fan speed control, all built on a modular code structure (APP, HAL, MCAL) for scalability and easy expansion. Perfect for DIY enthusiasts looking to create a customizable, secure, and automated home.

<img width="1536" height="1024" alt="control" src="https://github.com/user-attachments/assets/f7f89f42-e34c-4e80-8271-b208f79a6217" />


---

## 📱 Preview

ESP32 receives commands such as `"living_room_light:1"` from the Flutter app and toggles devices ON/OFF.

### Flutter App Screens
<p align="center">
<p>First Screen : Splash Screen</P>

<img width="30%" alt="Splash Screen" src="https://github.com/user-attachments/assets/3f057ad1-ff5e-41d0-91a9-11ba86d47d62" />

  <p>Second Screen : Login Screen</P>

  <img width="30%" alt="Login Screen" src="https://github.com/user-attachments/assets/65f0f4ab-c075-4fda-a3bd-1a7c2a7e5c65" />

  <p>Third Screen : Dashboard Screen</P>

**Dashboard Process :-**

  <img width="20%" alt="Process 1" src="https://github.com/user-attachments/assets/3583135c-abc4-4f9f-bd54-71927e682fd2" />

  <img width="20%" alt="Process 2" src="https://github.com/user-attachments/assets/b6e692bf-2d74-4b02-b2d1-fcb690d530d9" />
  <img width="20%" alt="Process 3" src="https://github.com/user-attachments/assets/68acf3a9-12ec-4e40-89dc-ccf1871359a7" />
  <img width="20%" alt="Process 4" src="https://github.com/user-attachments/assets/62753105-7258-4d61-80c4-3695a1051ae1" />

</p>


### Hardware Setup

https://github.com/user-attachments/assets/203a3d95-0419-44ed-b057-4e7cee84a488

---

## 🛠️ Features


1-  🔐 RFID Door Access System

 - Reads the card using an RFID module.

 - Displays the access result on an LCD screen.

 - If the card is invalid, the Buzzer is activated and "Access Denied" is shown.

 - If the card is valid, a Servo Motor opens the door for a set duration, displaying "Access Granted".

2- 👤 Room Occupancy Detection (Ultrasonic)

 - Uses an Ultrasonic Sensor to detect if someone is inside the room.

 - Automatically turns LED ON when a person is detected, and OFF when the room is empty.

3- 💨 Fan Speed Control

 - Controls the fan using three switches:

 - Switch 1: Low speed (30%).

 - Switch 2: Medium speed (60%).

 - Switch 3: Turns the fan OFF.

4- 📱 Bluetooth Home Device Control (via Flutter Mobile App)

 - Control home devices via Bluetooth from a Flutter mobile application.

 - Simple command format: device_name:state.

 - Real-time device status updates via Serial Monitor.


5- Modular code structure (APP – HAL – MCAL) for easy scalability.

6- Easily extendable to add new devices and commands.


---

## 📂 Project Structure

```
ESP32_Project/
├── APP/
│   ├── bluetooth_light_app.c   # Main app logic for light control
│
├── HAL/
│   ├── bluetooth.c/h           # Bluetooth communication functions
│   ├── light_control.c/h       # Device (light) control abstraction
│
├── MCAL/
│   ├── gpio.c/h                 # Low-level pin control
│
└── config/
    ├── device_config.h          # Device pin mapping and settings
```

---

## 🧰 Technologies Used

- **ESP32** (Arduino Core)  
- **AVR Microcontrollers**  
- **Arduino** (programming environment)  
- **Bluetooth Serial** (SPP)  
- **Flutter** (mobile app)  
- **C/C++** (embedded code)  

---

## 🚀 Getting Started

### Prerequisites

- Arduino IDE or PlatformIO installed
- ESP32 board added to Arduino IDE (`https://dl.espressif.com/dl/package_esp32_index.json`)
- Flutter SDK installed for mobile app development

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/RokiyaAbdElsatar/Smart-Home-.git
   ```

2. Open the ESP32 project in Arduino IDE.

3. Select the correct board (**ESP32 Dev Module**) and COM port.

4. Upload the code to your ESP32.

5. Open the Flutter app project and run it on your phone.

---

## 📲 Command Format

- **Turn ON light**:  
  ```
  living_room_light:1
  ```
- **Turn OFF light**:  
  ```
  living_room_light:0
  ```

---


## 🤝 Contributing

Pull requests are welcome! Please make sure your code follows the project’s coding style and is well-documented.

---

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

##  Authors

<ul>
<li> Rokiya Abd Elsatar
</li>
<li> Sama Alaa</li>
<li> Kerolos Moris
</li>
<li> Ahmed Mohamed
</li>
</ul>
