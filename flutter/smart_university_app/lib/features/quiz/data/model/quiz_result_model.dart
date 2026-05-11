class QuizResultModel {
  final int totalScore;
  final List<QuestionResult> questions;

  QuizResultModel({required this.totalScore, required this.questions});

  factory QuizResultModel.fromJson(Map<String, dynamic> json) {
    return QuizResultModel(
      totalScore: json['totalScore'],
      questions: (json['questions'] as List)
          .map((e) => QuestionResult.fromJson(e))
          .toList(),
    );
  }
}

class QuestionResult {
  final String question;
  final String selectedAnswer;
  final String correctAnswer;
  final bool isCorrect;
  final int grade;

  QuestionResult({
    required this.question,
    required this.selectedAnswer,
    required this.correctAnswer,
    required this.isCorrect,
    required this.grade,
  });

  factory QuestionResult.fromJson(Map<String, dynamic> json) {
    return QuestionResult(
      question: json['question'],
      selectedAnswer: json['selectedAnswer'],
      correctAnswer: json['correctAnswer'],
      isCorrect: json['isCorrect'],
      grade: json['grade'],
    );
  }
}
