import 'package:flutter/material.dart';
import 'package:smart_home/core/constant/colors.dart';
import 'package:smart_home/views/dashboard/UI/widgets/status_item.dart';

class StatusCard extends StatelessWidget {

  final int devicesOn;
  final int devicesOff;

  const StatusCard({
    super.key,
    required this.devicesOn,
    required this.devicesOff,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              textAlign: TextAlign.start,
              "Home Status",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                // StatusItem(
                //   title: 'People Inside',
                //   value: '3',  // HANDEL THE NUM OF PEPOLE ACCORDING TO RFID 
                //   valueColor: AppColors.iconColor,
                // ),
                StatusItem(
                  title: 'Devices On',
                  value: '$devicesOn',
                  valueColor: Color(0xff00a63e),
                ),
                StatusItem(
                  title: 'Devices Off',
                  value: '$devicesOff',
                  valueColor: AppColors.secondaryTextColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
