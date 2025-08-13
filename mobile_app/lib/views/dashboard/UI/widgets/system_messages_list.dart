import 'package:flutter/material.dart';
import 'package:smart_home/views/dashboard/data/model/system_message.dart';
import 'system_message_card.dart';

class SystemMessagesList extends StatelessWidget {
  final List<SystemMessage> messages;

  const SystemMessagesList({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "System Messages",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(height: 8),

            // عرض الرسائل داخل نفس الكارد الأبيض
            ...messages.map((msg) => SystemMessageCard(messageData: msg)),
          ],
        ),
      ),
    );
  }
}
