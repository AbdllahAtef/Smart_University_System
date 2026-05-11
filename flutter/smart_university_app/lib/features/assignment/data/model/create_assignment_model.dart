class CreateAssignmentModel {
  final String title;
  final String description;
  final String dueDate;
  final int maxGrade;
  final int courseId;

  CreateAssignmentModel({
    required this.title,
    required this.description,
    required this.dueDate,
    required this.maxGrade,
    required this.courseId,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "dueDate": dueDate,
      "maxGrade": maxGrade,
      "courseId": courseId,
    };
  }
}
