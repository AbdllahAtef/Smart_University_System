import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/assignment/data/model/assignments_model.dart';
import 'package:smart_university_app/features/assignment/presentation/helper/error_message_helper.dart';
import 'package:smart_university_app/features/assignment/presentation/views/screens/assigment_submission_screen.dart';
import 'package:smart_university_app/features/attendance/presentation/view/screens/attendance_screen.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';
import 'package:smart_university_app/features/quiz/data/model/quizes_model.dart';
import 'package:smart_university_app/features/quiz/presentation/manager/quiz_provider.dart';
import 'package:smart_university_app/features/quiz/presentation/views/screens/quiz_result_screen.dart';
import 'package:smart_university_app/features/quiz/presentation/views/screens/quiz_screen.dart';

class CardActionHelper {
  static Future<void> handleNavigation({
    required BuildContext context,
    required WidgetRef ref,
    AssignmentModel? assignment,
    QuizModel? quiz,
    bool isAttendance = false,
    CourseModel? course,
    int? sessionId,
  }) async {
    if (assignment != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AssigmentSubmissionScreen(assignment: assignment),
        ),
      );

      return;
    }

    if (isAttendance && course != null && sessionId != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              AttendanceScreen(course: course, sessionId: sessionId),
        ),
      );

      return;
    }

    if (quiz != null) {
      try {
        final status = await ref.read(quizStatusProvider(quiz.id).future);

        if (status == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("No data available for this quiz")),
          );

          return;
        }

        if (status.isSubmitted) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => QuizResultScreen(quiz: quiz)),
          );

          return;
        }

        ref.read(quizProvider.notifier).reset();

        if (!status.hasStarted) {
          await ref.read(quizServiceProvider).startQuiz(quiz.id);
        }

        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => QuizScreen(quiz: quiz)),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e is DioException ? getErrorMessage(e) : e.toString(),
            ),
          ),
        );
      }
    }
  }
}
