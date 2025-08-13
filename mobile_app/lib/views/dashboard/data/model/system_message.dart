import 'package:flutter/material.dart';


class SystemMessage {
  final String message;
  final DateTime time;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  SystemMessage({
    required this.message,
    required this.time,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
  });
}
