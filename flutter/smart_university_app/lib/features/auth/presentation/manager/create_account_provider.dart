import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/features/auth/data/models/register_model.dart';
import 'package:smart_university_app/features/auth/presentation/manager/states/create_account_state.dart';
import 'package:smart_university_app/features/auth/data/models/faculty_model.dart';
import 'package:smart_university_app/features/auth/data/services/auth_services.dart';

class CreateAccountNotifier extends StateNotifier<CreateAccountState> {
  CreateAccountNotifier() : super(CreateAccountState());

  final AuthService _authService = AuthService();

  void changeRole(String? role) {
    state = state.copyWith(role: role);
  }

  void changeFaculty(Faculty? faculty) {
    state = state.copyWith(faculty: faculty);
  }

  Future<bool> register() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final request = RegisterRequest(
        fullName: state.fullName,
        email: state.email,
        password: state.password,
        nationalId: state.nationalId,
        role: state.role!,
        facultyId: state.faculty?.id ?? 0,
      );

      await _authService.register(request: request);

      return true;
    } on DioException catch (e) {
      state = state.copyWith(error: e.response?.data.toString() ?? e.message);

      return false;
    } catch (e) {
      state = state.copyWith(error: e.toString());

      return false;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  void updateName(String name) {
    state = state.copyWith(fullName: name);
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  void updateNationalId(String id) {
    state = state.copyWith(nationalId: id);
  }

  void updateConfirmPassword(String value) {
    state = state.copyWith(confirmPassword: value);
  }

  void resetForm() {
    state = CreateAccountState();
  }
}

final createAccountProvider =
    StateNotifierProvider<CreateAccountNotifier, CreateAccountState>((ref) {
      return CreateAccountNotifier();
    });

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

final facultiesProvider = FutureProvider<List<Faculty>>((ref) async {
  final data = await AuthService().getFaculties();

  if (data.isEmpty) {
    return [];
  }

  return data
      .whereType<Map<String, dynamic>>()
      .map<Faculty>((e) => Faculty.fromJson(e))
      .toList();
});
