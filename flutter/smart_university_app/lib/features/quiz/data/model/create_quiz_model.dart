class CreateQuizModel {
  final int courseId;
  final String title;
  final int totalGrade;
  final DateTime quizDate;
  final int durationMinutes;

  CreateQuizModel({
    required this.courseId,
    required this.title,
    required this.totalGrade,
    required this.quizDate,
    required this.durationMinutes,
  });

  Map<String, dynamic> toJson() {
    return {
      "courseId": courseId,
      "title": title,
      "totalGrade": totalGrade,
      "quizDate": quizDate.toIso8601String(),
      "durationMinutes": durationMinutes,
    };
  }
}
