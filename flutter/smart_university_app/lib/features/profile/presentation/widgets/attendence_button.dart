import 'package:flutter/material.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class AttendenceButton extends StatelessWidget {
  const AttendenceButton({
    super.key,
    required this.onMarkAttend,
  });

  final VoidCallback onMarkAttend;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onMarkAttend,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFDCFCE7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          'Mark Attend',
          style: TextStyles.textstyle12.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}


