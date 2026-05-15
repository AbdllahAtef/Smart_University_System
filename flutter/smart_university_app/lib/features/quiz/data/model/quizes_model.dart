class QuizModel {
  final int id;
  final int courseId;
  final String title;
  final int totalGrade;
  final DateTime quizDate;
  final int durationMinutes;

  QuizModel({
    required this.id,
    required this.courseId,
    required this.title,
    required this.totalGrade,
    required this.quizDate,
    required this.durationMinutes,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      id: int.tryParse(json['id']?.toString() ?? '') ?? 0,
      courseId: int.tryParse(json['courseId']?.toString() ?? '') ?? 0,
      title: json['title'] ?? '',
      totalGrade: int.tryParse(json['totalGrade']?.toString() ?? '') ?? 0,
      durationMinutes:
          int.tryParse(json['durationMinutes']?.toString() ?? '') ?? 0,
      quizDate: json['quizDate'] != null
          ? DateTime.parse(json['quizDate'].toString())
          : DateTime.now(),
    );
  }
}
