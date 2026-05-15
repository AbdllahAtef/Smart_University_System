class CreateQuestionModel {
  final int quizId;
  final String text;
  final int grade;
  final List<CreateOptionModel> options;

  CreateQuestionModel({
    required this.quizId,
    required this.text,
    required this.grade,
    required this.options,
  });

  Map<String, dynamic> toJson() {
    return {
      "quizId": quizId,
      "text": text,
      "grade": grade,
      "options": options.map((e) => e.toJson()).toList(),
    };
  }
}

class CreateOptionModel {
  final String text;
  final bool isCorrect;

  CreateOptionModel({required this.text, required this.isCorrect});

  Map<String, dynamic> toJson() {
    return {"text": text, "isCorrect": isCorrect};
  }
}
