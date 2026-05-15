import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/helpers/card_action_helper.dart';
import 'package:smart_university_app/features/assignment/data/model/assignments_model.dart';
import 'package:smart_university_app/features/auth/presentation/manager/user_id_provider.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';
import 'package:smart_university_app/features/quiz/data/model/quizes_model.dart';

class CardAction extends ConsumerWidget {
  final Color color;
  final AssignmentModel? assignment;
  final QuizModel? quiz;
  final bool isAttendance;
  final CourseModel? course;
  final int? sessionId;

  const CardAction({
    super.key,
    required this.color,
    this.assignment,
    this.sessionId,
    this.quiz,
    this.isAttendance = false,
    this.course,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref.watch(userRoleProvider);
    if (role == "doctor" && (quiz != null || assignment != null)) {
      return const SizedBox();
    }
    return GestureDetector(
      onTap: () {
        CardActionHelper.handleNavigation(
          context: context,
          ref: ref,
          assignment: assignment,
          quiz: quiz,
          isAttendance: isAttendance,
          course: course,
          sessionId: sessionId,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Icon(
          assignment != null
              ? Icons.upload_file_outlined
              : quiz != null
              ? Icons.start_sharp
              : Icons.check_circle_outline,
          color: Colors.white,
        ),
      ),
    );
  }
}
