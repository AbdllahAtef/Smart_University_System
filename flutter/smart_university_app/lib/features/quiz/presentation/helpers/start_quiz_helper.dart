import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/quiz/data/model/quiz_status_model.dart';
import 'package:smart_university_app/features/quiz/presentation/manager/timer_provider.dart';

class StartQuizHelper {
  static void start({
    required WidgetRef ref,
    required QuizStatusModel? status,
  }) {
    if (status == null) return;

    if (status.remainingSeconds > 0) {
      ref.read(quizTimerProvider.notifier).start(status.remainingSeconds);
    }
  }
}
