import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_home/core/constant/colors.dart';
import 'package:smart_home/core/embedded/bluetooth_controls.dart';
import 'package:smart_home/views/dashboard/UI/widgets/device_section.dart';
import 'package:smart_home/views/dashboard/UI/widgets/status_card.dart';
import 'package:smart_home/views/dashboard/UI/widgets/system_messages_list.dart';
import 'package:smart_home/views/dashboard/data/model/device_item.dart';
import 'package:smart_home/views/dashboard/data/model/system_message.dart';
import 'package:smart_home/core/widgets/logo.dart';

class DashboardScreen extends StatefulWidget {
  final String user;

  const DashboardScreen({super.key, required this.user});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late List<DeviceItem> lights;
  late List<DeviceItem> fans;
  late List<DeviceItem> doors;
  List<SystemMessage> systemMessages = [];

  final BluetoothControls bluetooth = BluetoothControls();

  @override
  void initState() {
    super.initState();

    lights = [
      DeviceItem(
        label: 'Living Room Light',
        subLabel: 'Living Room',
        onIcon: FontAwesomeIcons.solidLightbulb,
        offIcon: FontAwesomeIcons.lightbulb,
        isOn: false,
      ),
      // DeviceItem(
      //   label: 'Bedroom Light',
      //   subLabel: 'Bedroom',
      //   onIcon: FontAwesomeIcons.solidLightbulb,
      //   offIcon: FontAwesomeIcons.lightbulb,
      //   isOn: false,
      // ),
      // DeviceItem(
      //   label: 'Kitchen Light',
      //   subLabel: 'Kitchen',
      //   onIcon: FontAwesomeIcons.solidLightbulb,
      //   offIcon: FontAwesomeIcons.lightbulb,
      //   isOn: false,
      // ),
    ];

    // fans = [
    //   DeviceItem(
    //     label: 'Living Room Fan',
    //     subLabel: 'Living Room',
    //     onIcon: FontAwesomeIcons.fan,
    //     offIcon: FontAwesomeIcons.fan,
    //     isOn: false,
    //   ),
    //   DeviceItem(
    //     label: 'Bedroom Fan',
    //     subLabel: 'Bedroom',
    //     onIcon: FontAwesomeIcons.fan,
    //     offIcon: FontAwesomeIcons.fan,
    //     isOn: false,
    //   ),
    // ];

    // doors = [
    //   DeviceItem(
    //     label: 'Front Door',
    //     subLabel: 'Entrance',
    //     onIcon: FontAwesomeIcons.doorOpen,
    //     offIcon: Icons.door_back_door_outlined,
    //     isOn: false,
    //   ),
    // ];
  }

  int get devicesOnCount => [...lights].where((d) => d.isOn).length;

  int get devicesOffCount => [...lights].where((d) => !d.isOn).length;

  void updateDevice(DeviceItem device, bool isOn) {
    setState(() {
      device.isOn = isOn;

      systemMessages.insert(
        0,
        SystemMessage(
          message: "${device.label} has been turned ${isOn ? 'ON' : 'OFF'}",
          time: DateTime.now(),
          icon: isOn ? device.onIcon : device.offIcon,
          iconColor: isOn ? Colors.green : Colors.red,
          backgroundColor: isOn ? Colors.green.shade50 : Colors.red.shade50,
        ),
      );
    });
  }

  // فانكشن لإرسال البيانات للـ ESP مع تحديث الواجهة
  void sendBluetoothData({required String type, required String state}) {
    bluetooth.sendData(type: type, state: state);
  }

  // فانكشن تتعامل مع التبديل بين اتصال وفصل
  Future<void> toggleBluetoothConnection() async {
    if (bluetooth.isConnected) {
      bluetooth.disconnect();
      setState(() {});
    } else {
      await bluetooth.connectToESP();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: LogoWidget(
            width: 25,
            height: 25,
            background: Colors.black,
            iconColor: Colors.white,
            iconSize: 25,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SmartHome',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Hello, ${widget.user}',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: toggleBluetoothConnection,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    bluetooth.isConnected
                        ? Icons.bluetooth_connected
                        : Icons.bluetooth_disabled,
                    color: bluetooth.isConnected ? Colors.blue : Colors.grey,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    bluetooth.isConnected ? 'Connected' : 'NotConnected',
                    style: TextStyle(color: Colors.black54, fontSize: 13),
                  ),
                  SizedBox(width: 5),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(EvaIcons.logOutOutline, color: Colors.black, size: 20),
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          StatusCard(devicesOn: devicesOnCount, devicesOff: devicesOffCount),
          SizedBox(height: 20),
          Text(
            "Device Controls",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          DeviceControlSection(
            title: 'Lights',
            activeColor: Colors.amber,
            onToggle: (device, val) {
              updateDevice(device, val);
              // ابعت النوع (مثلاً label بالlowercase بدون مسافات) مع الحالة '1' أو '0'
              String type = device.label.toLowerCase().replaceAll(' ', '_');
              String state = val ? '1' : '0';
              bluetooth.sendData(type: type, state: state);
            },
            devices: lights,
            onSwitchChanged: (val) {},
          ),

          SizedBox(height: 10),
          // DeviceControlSection(
          //   title: 'Fans',
          //   activeColor: AppColors.iconColor,
          //   onToggle: (device, val) {
          //     updateDevice(device, val);
          //     String type = device.label.toLowerCase().replaceAll(' ', '_');
          //     String state = val ? '1' : '0';
          //     bluetooth.sendData(type: type, state: state);
          //   },
          //   devices: fans,
          //   onSwitchChanged: (val) {},
          // ),

          // SizedBox(height: 10),
          // DeviceControlSection(
          //   title: 'Doors',
          //   activeColor: Colors.deepOrange,
          //   onToggle: (device, val) {
          //     updateDevice(device, val);
          //     String type = device.label.toLowerCase().replaceAll(' ', '_');
          //     String state = val ? '1' : '0';
          //     bluetooth.sendData(type: type, state: state);
          //   },
          //   devices: doors,
          //   onSwitchChanged: (val) {},
          // ),
          // SizedBox(height: 10),
          // ...
          bluetooth.isConnected
              ? SystemMessagesList(messages: systemMessages)
              : Builder(
                  builder: (context) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Bluetooth is not connected"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    });
                    return const SizedBox.shrink(); // عشان يرجع Widget فاضية
                  },
                ),
        ],
      ),
    );
  }
}
