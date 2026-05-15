import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/schedule/presentation/views/widgets/lecture_card.dart';
import 'package:smart_university_app/features/schedule/presentation/views/widgets/time_column.dart';

class LectureItem extends StatelessWidget {
  const LectureItem({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.title,
    required this.subtitle,
    required this.room,
    required this.instructor,
    required this.color,
  });

  final String startTime;
  final String endTime;
  final String title;
  final String subtitle;
  final String room;
  final String instructor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TimeColumn(startTime: startTime, endTime: endTime),
        SizedBox(
          height: 130.h,
          child: VerticalDivider(
            color: Colors.grey.withOpacity(0.5),
            thickness: 1,
          ),
        ),
        Expanded(
          child: LectureCard(
            title: title,
            subtitle: subtitle,
            room: room,
            instructor: instructor,
            color: color,
          ),
        ),
      ],
    );
  }
}

