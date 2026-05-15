import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/features/quiz/data/model/question_form_model.dart';

final questionFormProvider =
    StateNotifierProvider<QuestionFormNotifier, List<QuestionFormModel>>(
      (ref) => QuestionFormNotifier(),
    );

class QuestionFormNotifier extends StateNotifier<List<QuestionFormModel>> {
  QuestionFormNotifier() : super([QuestionFormModel()]);

  void addQuestion() {
    state = [...state, QuestionFormModel()];
  }

  void removeQuestion(int index) {
    final updated = [...state];
    updated.removeAt(index);
    state = updated;
  }

  void updateQuestion(int index, String value) {
    final updated = [...state];

    updated[index] = updated[index].copyWith(question: value);

    state = updated;
  }

  void updateGrade(int index, String value) {
    final updated = [...state];

    updated[index] = updated[index].copyWith(grade: value);

    state = updated;
  }

  void updateOption(int questionIndex, int optionIndex, String value) {
    final updated = [...state];

    final options = [...updated[questionIndex].options];

    options[optionIndex] = value;

    updated[questionIndex] = updated[questionIndex].copyWith(options: options);

    state = updated;
  }

  void changeCorrectAnswer(int questionIndex, int correctIndex) {
    final updated = [...state];

    updated[questionIndex] = updated[questionIndex].copyWith(
      correctIndex: correctIndex,
    );

    state = updated;
  }

  void clear() {
    state = [QuestionFormModel()];
  }
}
