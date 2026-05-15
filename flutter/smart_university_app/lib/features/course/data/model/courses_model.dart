class CourseModel {
  final int id;
  final String name;
  final String code;
  final String description;

  CourseModel({
    required this.id,
    required this.name,
    required this.code,
    required this.description,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
