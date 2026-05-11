import 'package:flutter/material.dart';

class TimeColumn extends StatelessWidget {
  const TimeColumn({super.key, required this.startTime, required this.endTime});

  final String startTime;
  final String endTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              startTime,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(endTime, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
