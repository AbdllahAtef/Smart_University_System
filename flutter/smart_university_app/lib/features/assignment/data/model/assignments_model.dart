class AssignmentModel {
  final int id;
  final int? courseId;
  final String title;
  final String description;
  final DateTime dueDate;
  final int maxGrade;

  AssignmentModel({
    required this.id,
    this.courseId,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.maxGrade,
  });

  factory AssignmentModel.fromJson(Map<String, dynamic> json) {
    return AssignmentModel(
      id: json['id'],
      courseId: json['courseId'] ?? json['course']?['id'] ?? 0,
      title: json['title'],
      description: json['description'],
      dueDate: DateTime.parse(json['dueDate']),
      maxGrade: json['maxGrade'],
    );
  }
}
