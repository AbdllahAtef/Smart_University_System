class CourseStudentsModel {
  final int id;
  final String fullName;

  CourseStudentsModel({
    required this.id,
    required this.fullName,
  });

  factory CourseStudentsModel.fromJson(Map<String, dynamic> json) {
    return CourseStudentsModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      fullName: json['fullName'] ?? '',
    );
  }
}
