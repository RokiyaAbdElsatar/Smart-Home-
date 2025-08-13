import 'package:flutter/material.dart';

class DeviceItem {
  String label;
  String subLabel;
  IconData onIcon;
  IconData offIcon;
  bool isOn;

  DeviceItem({
    required this.label,
    required this.subLabel,
    required this.onIcon,
    required this.offIcon,
    this.isOn = false,
  });
}
