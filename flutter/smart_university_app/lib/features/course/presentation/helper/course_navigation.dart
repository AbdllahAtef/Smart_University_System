import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/assignment/presentation/views/screens/create_assignment_screen.dart';
import 'package:smart_university_app/features/attendance/presentation/manager/attendence_provider.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';
import 'package:smart_university_app/features/quiz/presentation/views/screens/create_quiz_screen.dart';

Future<void> handleCourseAction({
  required BuildContext context,
  required WidgetRef ref,
  required int tabIndex,
  required CourseModel course,
}) async {
  if (tabIndex == 0) {
    Navigator.push(
      context,

      MaterialPageRoute(builder: (_) => CreateAssignmentScreen(course: course)),
    );

    return;
  }
  if (tabIndex == 1) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CreateQuizScreen(course: course)),
    );

    return;
  }
  if (tabIndex == 2) {
    try {
      await ref.read(attendanceSessionsProvider.notifier).addSession(course.id);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }

    return;
  }
}
