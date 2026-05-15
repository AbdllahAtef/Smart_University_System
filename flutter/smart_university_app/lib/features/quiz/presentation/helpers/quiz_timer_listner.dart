import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/quiz/presentation/helpers/submit_quiz_helper.dart';
import 'package:smart_university_app/features/quiz/presentation/manager/quiz_provider.dart';

class QuizTimerListenerHelper {
  static Future<void> listen({
    required BuildContext context,
    required WidgetRef ref,
    required int previous,
    required int next,
    required int quizId,
  }) async {
    final quizState = ref.read(quizProvider);

    if (next == 0 && previous != 0 && !quizState.isSubmitting) {
      await SubmitQuizHelper.submit(ref: ref, quizId: quizId);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Time is up! Submitting...")),
        );
      }
    }
  }
}
