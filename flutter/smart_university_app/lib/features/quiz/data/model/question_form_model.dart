class QuestionFormModel {
  final String question;
  final String grade;
  final List<String> options;
  final int correctIndex;

  QuestionFormModel({
    this.question = '',
    this.grade = '',
    this.options = const ['', '', '', ''],
    this.correctIndex = 0,
  });

  QuestionFormModel copyWith({
    String? question,
    String? grade,
    List<String>? options,
    int? correctIndex,
  }) {
    return QuestionFormModel(
      question: question ?? this.question,
      grade: grade ?? this.grade,
      options: options ?? this.options,
      correctIndex: correctIndex ?? this.correctIndex,
    );
  }
}
