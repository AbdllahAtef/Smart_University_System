import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePickerHelper {
  static Future<String?> pickTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked == null) return null;

    final now = DateTime.now();

    final date = DateTime(
      now.year,
      now.month,
      now.day,
      picked.hour,
      picked.minute,
    );

    return DateFormat('HH:mm:ss').format(date);
  }
}
