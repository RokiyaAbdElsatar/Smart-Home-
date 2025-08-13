import 'package:flutter/material.dart';
import 'package:smart_home/core/constant/colors.dart';

class StatusItem extends StatelessWidget {
  final String title;
  final String value;
  final Color valueColor;

  const StatusItem({
    required this.title,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: valueColor,
          ),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 14, color: AppColors.secondaryTextColor),
        ),
      ],
    );
  }
}
