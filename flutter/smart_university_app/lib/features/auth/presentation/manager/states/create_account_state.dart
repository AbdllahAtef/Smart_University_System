import 'package:smart_university_app/features/auth/data/models/faculty_model.dart';

class CreateAccountState {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;
  final String nationalId;

  final String? role;
  final Faculty? faculty;

  final bool isLoading;
  final String? error;

  CreateAccountState({
    this.fullName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.nationalId = '',
    this.role,
    this.faculty,
    this.isLoading = false,
    this.error,
  });

  CreateAccountState copyWith({
    String? fullName,
    String? email,
    String? password,
    String? confirmPassword,
    String? nationalId,
    String? role,
    Faculty? faculty,
    bool? isLoading,
    String? error,
  }) {
    return CreateAccountState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      nationalId: nationalId ?? this.nationalId,
      role: role ?? this.role,
      faculty: faculty ?? this.faculty,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

