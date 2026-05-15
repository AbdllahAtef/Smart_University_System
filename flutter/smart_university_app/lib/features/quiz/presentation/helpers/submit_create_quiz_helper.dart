import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';
import 'package:smart_university_app/features/quiz/data/model/create_quiz_model.dart';
import 'package:smart_university_app/features/quiz/presentation/helpers/create_quiz_helper.dart';
import 'package:smart_university_app/features/quiz/presentation/manager/create_quiz_provider.dart';

class CreateQuizSubmitHelper {
  static Future<void> submit({
    required BuildContext context,
    required WidgetRef ref,
    required CourseModel course,
    required TextEditingController titleController,
    required TextEditingController gradeController,
    required TextEditingController durationController,
    required DateTime? selectedDate,
  }) async {
    if (CreateQuizHelper.isQuizInvalid(
      title: titleController.text,
      date: selectedDate,
      grade: gradeController.text,
      duration: durationController.text,
    )) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all quiz info")),
      );

      return;
    }

    final questions = ref.read(createQuestionsProvider);

    final success = await ref
        .read(createQuizProvider.notifier)
        .createQuiz(
          quiz: CreateQuizModel(
            courseId: course.id,
            title: titleController.text,
            totalGrade: int.parse(gradeController.text),
            durationMinutes: int.parse(durationController.text),
            quizDate: selectedDate!,
          ),
          questions: CreateQuizHelper.buildQuestions(questions),
        );

    if (!context.mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Quiz Created Successfully")),
      );

      Navigator.pop(context, true);
    } else {
      final error = ref.read(createQuizProvider).error;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error ?? "Something went wrong")));
    }
  }
}
