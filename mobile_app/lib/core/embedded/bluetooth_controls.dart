import 'dart:typed_data';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:permission_handler/permission_handler.dart';

class BluetoothControls {
  BluetoothConnection? connection;
  bool isConnected = false;

  Future<void> requestPermissions() async {
    await Permission.bluetooth.request();
    await Permission.bluetoothConnect.request();
    await Permission.bluetoothScan.request();
    await Permission.location.request();
  }

  Future<void> connectToESP() async {
    await requestPermissions();

    String address = "F8:B3:B7:43:4C:BE"; // MAC address of ESP32

    try {
      print("Connecting to $address ...");
      connection = await BluetoothConnection.toAddress(address);
      isConnected = true;
      print("✅ Connected to ESP32");
    } catch (e) {
      print("❌ Error: $e");
    }
  }

  // void sendData(String data) {
  //   if (connection != null && connection!.isConnected) {
  //     print("📤 Sending: $data");
  //     connection!.output.add(Uint8List.fromList(data.codeUnits));
  //     connection!.output.allSent;
  //   } else {
  //     print("⚠️ Not connected!");
  //   }
  // }

  void sendData({required String type, required String state}) {
  if (connection != null && connection!.isConnected) {
    print("🌀Type: $type\n📤 Sending: $state");
    String combined = "$type:$state"; // ممكن ترسلي بصيغة "type:state"
    connection!.output.add(Uint8List.fromList(combined.codeUnits));
    connection!.output.allSent;
  } else {
    print("⚠️ Not connected!");
  }
}

  void disconnect() {
    if (connection != null && connection!.isConnected) {
      connection!.dispose();
      isConnected = false;
      print("🔌 Disconnected");
    }
  }
}
