import 'dart:async';
import 'package:flutter_riverpod/legacy.dart';

final quizTimerProvider = StateNotifierProvider<QuizTimerNotifier, int>((ref) {
  return QuizTimerNotifier();
});

class QuizTimerNotifier extends StateNotifier<int> {
  QuizTimerNotifier() : super(0);

  Timer? _timer;

  void start(int seconds) {
    state = seconds;

    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 0) {
        state--;
      } else {
        timer.cancel();


      }
    });
  }

  void stop() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
