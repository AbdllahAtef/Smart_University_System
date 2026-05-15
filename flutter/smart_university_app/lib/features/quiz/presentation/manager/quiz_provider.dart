import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/features/quiz/data/model/question_model.dart';
import 'package:smart_university_app/features/quiz/data/model/quiz_status_model.dart';
import 'package:smart_university_app/features/quiz/data/model/quizes_model.dart';
import 'package:smart_university_app/features/quiz/data/services/quiz_services.dart';
import 'package:smart_university_app/features/quiz/presentation/manager/states/quiz_state.dart';

final quizServiceProvider = Provider((ref) {
  return QuizService();
});

final quizzesProvider = FutureProvider.family<List<QuizModel>, int>((
  ref,
  courseId,
) async {
  final service = ref.read(quizServiceProvider);

  return service.getQuizzes(courseId);
});

final questionsProvider = FutureProvider.family<List<QuestionModel>, int>((
  ref,
  quizId,
) async {
  final service = ref.read(quizServiceProvider);

  return service.getQuestions(quizId);
});

final quizStatusProvider = FutureProvider.family<QuizStatusModel?, int>((
  ref,
  quizId,
) async {
  final service = ref.read(quizServiceProvider);

  return service.getQuizStatus(quizId);
});

final quizResultProvider = FutureProvider.family((ref, int quizId) async {
  final service = ref.read(quizServiceProvider);

  return service.getQuizResult(quizId);
});

final quizProvider = StateNotifierProvider<QuizNotifier, QuizState>((ref) {
  return QuizNotifier(ref);
});

class QuizNotifier extends StateNotifier<QuizState> {
  final Ref ref;

  QuizNotifier(this.ref) : super(QuizState());

  void selectAnswer(int questionId, int optionId) {
    final updated = Map<int, int>.from(state.answers);

    updated[questionId] = optionId;

    state = state.copyWith(answers: updated);
  }

  void nextQuestion(int totalQuestions) {
    if (state.currentIndex < totalQuestions - 1) {
      state = state.copyWith(currentIndex: state.currentIndex + 1);
    }
  }

  void previousQuestion() {
    if (state.currentIndex > 0) {
      state = state.copyWith(currentIndex: state.currentIndex - 1);
    }
  }

  Future<bool> submitQuiz(int quizId) async {
    state = state.copyWith(isSubmitting: true, error: null);

    try {
      final service = ref.read(quizServiceProvider);

      await service.submitQuiz(quizId, state.answers);

      state = state.copyWith(isSubmitting: false);

      return true;
    } catch (e) {
      state = state.copyWith(isSubmitting: false, error: e.toString());

      return false;
    }
  }

  void reset() {
    state = QuizState();
  }
}
final questionsWithAnswersProvider =
    FutureProvider.family<List<QuestionModel>, int>((ref, quizId) async {
      final service = ref.read(quizServiceProvider);

      return service.getQuestionsWithAnswers(quizId);
    });
