import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color background;
  final Color iconColor;
  final double? iconSize;
  final double? blurRadius;
  const LogoWidget({
    super.key,
    required this.width,
    required this.height,
    required this.background,
    required this.iconColor,
    this.iconSize,
    this.blurRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: background,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(136, 61, 60, 60).withValues(alpha: 0.2),
            blurRadius: blurRadius ?? 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Icon(EvaIcons.homeOutline, size: iconSize ?? 55, color: iconColor),
    );
  }
}
