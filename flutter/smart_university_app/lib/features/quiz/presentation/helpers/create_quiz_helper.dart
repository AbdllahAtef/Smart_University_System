import 'package:smart_university_app/features/quiz/data/model/create_question_model.dart';
import 'package:smart_university_app/features/quiz/data/model/question_form_model.dart';

class CreateQuizHelper {
  static bool isQuizInvalid({
    required String title,
    required DateTime? date,
    required String grade,
    required String duration,
  }) {
    return title.isEmpty || date == null || grade.isEmpty || duration.isEmpty;
  }

  static List<CreateQuestionModel> buildQuestions(
    List<QuestionFormModel> questions,
  ) {
    return questions.map((q) {
      return CreateQuestionModel(
        quizId: 0,
        text: q.question,
        grade: int.tryParse(q.grade) ?? 0,
        options: q.options.asMap().entries.map((opt) {
          return CreateOptionModel(
            text: opt.value,
            isCorrect: q.correctIndex == opt.key,
          );
        }).toList(),
      );
    }).toList();
  }
}
