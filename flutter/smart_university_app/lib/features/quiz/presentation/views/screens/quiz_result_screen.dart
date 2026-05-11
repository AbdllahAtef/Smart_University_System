import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/quiz/data/model/quizes_model.dart';
import 'package:smart_university_app/features/quiz/presentation/manager/quiz_provider.dart';
import 'package:smart_university_app/features/quiz/presentation/views/widgets/quiz_result_view.dart';


class QuizResultScreen extends ConsumerWidget {
  final QuizModel quiz;

  const QuizResultScreen({super.key, required this.quiz});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultAsync = ref.watch(quizResultProvider(quiz.id));

    return Scaffold(
      body: resultAsync.when(
        data: (result) {
          if (result == null) {
            return const Center(child: Text("No result available"));
          }

          return Padding(
            padding: const EdgeInsets.all(48),
            child: QuizResultView(
              score: result.totalScore,
              total: quiz.totalGrade,
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Error: $e")),
      ),
    );
  }
}

