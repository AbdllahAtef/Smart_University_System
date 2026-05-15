import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smart_university_app/core/widgets/card_action.dart';
import 'package:smart_university_app/core/widgets/card_content.dart';
import 'package:smart_university_app/core/widgets/card_leading.dart';
import 'package:smart_university_app/features/assignment/data/model/assignments_model.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';
import 'package:smart_university_app/features/quiz/data/model/quizes_model.dart';

class UniversalCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String? extra;
  final IconData icon;
  final Color color;
  final AssignmentModel? assignment;
  final QuizModel? quiz;
  final CourseModel? course;
  final bool isAttendance;
  final int? sessionId;

  const UniversalCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    this.extra,
    required this.icon,
    required this.color,
    this.assignment,
    this.quiz,
    this.course,
    this.isAttendance = false,
    this.sessionId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(16),
        border: Border(
          left: BorderSide(color: color, width: 4.w),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardLeading(icon: icon, color: color),
          const SizedBox(width: 12),
          Expanded(
            child: CardContent(
              title: title,
              description: description,
              date: date,
              extra: extra,
              color: color,
            ),
          ),
          CardAction(
            color: color,
            assignment: assignment,
            quiz: quiz,
            isAttendance: isAttendance,
            course: course,
            sessionId: sessionId,
          ),
        ],
      ),
    );
  }
}
