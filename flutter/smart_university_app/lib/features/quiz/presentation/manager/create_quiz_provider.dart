import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/features/quiz/data/model/create_question_model.dart';
import 'package:smart_university_app/features/quiz/data/model/create_quiz_model.dart';
import 'package:smart_university_app/features/quiz/data/model/question_form_model.dart';
import 'package:smart_university_app/features/quiz/presentation/manager/quiz_provider.dart';
import 'package:smart_university_app/features/quiz/presentation/manager/states/create_quiz_state.dart';

final createQuestionsProvider =
    StateNotifierProvider.autoDispose<
      CreateQuestionsNotifier,
      List<QuestionFormModel>
    >((ref) {
      return CreateQuestionsNotifier();
    });

class CreateQuestionsNotifier extends StateNotifier<List<QuestionFormModel>> {
  CreateQuestionsNotifier() : super([QuestionFormModel()]);

  void addQuestion() {
    state = [...state, QuestionFormModel()];
  }

  void removeQuestion(int index) {
    if (state.length == 1) return;

    final updated = [...state];

    updated.removeAt(index);

    state = updated;
  }

  void selectCorrect(int questionIndex, int optionIndex) {
    final updated = [...state];

    updated[questionIndex] = updated[questionIndex].copyWith(
      correctIndex: optionIndex,
    );

    state = updated;
  }

  void updateQuestion(int index, String value) {
    final updated = [...state];

    updated[index] = updated[index].copyWith(question: value);

    state = updated;
  }

  void updateOption(int questionIndex, int optionIndex, String value) {
    final updated = [...state];

    final options = List<String>.from(updated[questionIndex].options);

    options[optionIndex] = value;

    updated[questionIndex] = updated[questionIndex].copyWith(options: options);

    state = updated;
  }

  void updateGrade(int index, String value) {
    final updated = [...state];

    updated[index] = updated[index].copyWith(grade: value);

    state = updated;
  }
}

final createQuizProvider =
    StateNotifierProvider<CreateQuizNotifier, CreateQuizState>((ref) {
      return CreateQuizNotifier(ref);
    });

class CreateQuizNotifier extends StateNotifier<CreateQuizState> {
  final Ref ref;

  CreateQuizNotifier(this.ref) : super(const CreateQuizState());

  Future<bool> createQuiz({
    required CreateQuizModel quiz,
    required List<CreateQuestionModel> questions,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final service = ref.read(quizServiceProvider);

      final quizId = await service.createQuiz(quiz);

      for (final question in questions) {
        await service.createQuestion(
          CreateQuestionModel(
            quizId: quizId,
            text: question.text,
            grade: question.grade,
            options: question.options,
          ),
        );
      }

      ref.invalidate(quizzesProvider);

      state = state.copyWith(isLoading: false);

      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());

      return false;
    }
  }
}
