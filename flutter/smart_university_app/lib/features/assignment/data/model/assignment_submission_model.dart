class AssignmentSubmissionModel {
  final int id;
  final int assignmentId;
  final int studentId;
  final String? filePath;
  final int? grade;

  AssignmentSubmissionModel({
    required this.id,
    required this.assignmentId,
    required this.studentId,
    this.filePath,
    this.grade,
  });

  factory AssignmentSubmissionModel.fromJson(Map<String, dynamic> json) {
    return AssignmentSubmissionModel(
      id: int.parse(json['id'].toString()),
      assignmentId: int.parse(json['assignmentId'].toString()),
      studentId: int.parse(json['studentId'].toString()),
      filePath: json['filePath'],
      grade: json['grade'] != null
          ? int.parse(json['grade'].toString())
          : null,
    );
  }
}