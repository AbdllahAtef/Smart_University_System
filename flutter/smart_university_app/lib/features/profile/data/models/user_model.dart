class UserModel {
  final int id;
  final String fullName;
  final String email;
  final String role;
  final int facultyId;
  final String nationalId;
  final String facultyName;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.role,
    required this.facultyId,
    required this.nationalId,
    required this.facultyName,
  });

factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,

      fullName: json['fullName']?.toString() ?? '',

      email: json['email']?.toString() ?? '',

      role: json['role']?.toString() ?? '',

      facultyId: json['facultyId'] ?? 0,

      nationalId: json['nationalId']?.toString() ?? '',

      facultyName: json['facultyName']?.toString() ?? '',
    );
  }
}
