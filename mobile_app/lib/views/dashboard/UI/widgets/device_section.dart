import 'package:flutter/material.dart';
import 'package:smart_home/core/constant/colors.dart';
import 'package:smart_home/views/dashboard/data/model/device_item.dart';

class DeviceControlSection extends StatefulWidget {
  final String title;
  final List<DeviceItem> devices;
  final Color activeColor;
  final Function(DeviceItem, bool) onToggle;
  final Function(bool) onSwitchChanged;

  const DeviceControlSection({
    super.key,
    required this.title,
    required this.devices,
    required this.activeColor,
    required this.onToggle, required this.onSwitchChanged,
  });

  @override
  State<DeviceControlSection> createState() => _DeviceControlSectionState();
}

class _DeviceControlSectionState extends State<DeviceControlSection> {
  @override
  Widget build(BuildContext context) {
    int onCount = widget.devices.where((d) => d.isOn).length;

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Chip(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 3,
                    vertical: 3,
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color.fromARGB(197, 217, 215, 215),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text('$onCount ON'),
                  backgroundColor: Colors.white,
                  labelStyle: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 8),

            ...widget.devices.map((device) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  leading: Icon(
                    device.isOn ? device.onIcon : device.offIcon,
                    color: device.isOn ? widget.activeColor : Colors.grey,
                    size: 20,
                  ),
                  title: Text(
                    device.label,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(device.subLabel),
                  trailing: Transform.scale(
                    scale: .8,
                    child: Switch.adaptive(
                      value: device.isOn,
                      onChanged: (val) {
                        setState(() {
                          device.isOn = val;
                          widget.onToggle(device, val);
                           widget.onSwitchChanged(val);
                        });
                      },
                      activeTrackColor: AppColors.iconColor,
                      inactiveThumbColor: AppColors.secondaryTextColor,
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
