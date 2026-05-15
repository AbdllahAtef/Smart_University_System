class RegisterRequest {
  final String fullName;
  final String email;
  final String password;
  final String nationalId;
  final String role;
  final int facultyId;

  RegisterRequest({
    required this.fullName,
    required this.email,
    required this.password,
    required this.nationalId,
    required this.role,
    required this.facultyId,
  });

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "password": password,
      "nationalId": nationalId,
      "role": role,
      "facultyId": facultyId,
    };
  }
}