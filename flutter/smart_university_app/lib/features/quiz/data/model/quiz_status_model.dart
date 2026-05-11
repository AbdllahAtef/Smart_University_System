class QuizStatusModel {
  final bool hasStarted;
  final bool isFinished;
  final bool isSubmitted;
  final int remainingSeconds;

  QuizStatusModel({
    required this.hasStarted,
    required this.isFinished,
    required this.isSubmitted,
    required this.remainingSeconds,
  });

  factory QuizStatusModel.fromJson(Map<String, dynamic> json) {
    return QuizStatusModel(
      hasStarted: json['hasStarted'] ?? false,
      isFinished: json['isFinished'] ?? false,
      isSubmitted: json['isSubmitted'] ?? false,
      remainingSeconds: json['remainingSeconds'] ?? 0,
    );
  }
}
