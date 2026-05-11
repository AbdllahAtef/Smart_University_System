import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class DateHeader extends StatelessWidget {
  const DateHeader({
    super.key,
    required this.date,
    required this.dayName,
    required this.monthYear,
  });
  final DateTime date;
  final String dayName;
  final String monthYear;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          date.day.toString().padLeft(2, '0'),
          style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dayName,
              style: TextStyles.textstyle16.copyWith(color: Colors.grey),
            ),
            Text(
              monthYear,
              style: TextStyles.textstyle14.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}


