import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/features/auth/data/models/login_model.dart';
import 'package:smart_university_app/features/auth/presentation/manager/states/login_state.dart';
import 'package:smart_university_app/features/auth/presentation/manager/user_id_provider.dart';
import 'package:smart_university_app/core/network/dio_helper.dart';
import 'package:smart_university_app/features/auth/data/services/auth_services.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(ref);
});

class LoginNotifier extends StateNotifier<LoginState> {
  final Ref ref;

  LoginNotifier(this.ref) : super(LoginState());

  final AuthService _authService = AuthService();

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  void _setError(String message) {
    state = state.copyWith(error: message);
  }

  Future<bool> login() async {
    if (state.email.isEmpty || state.password.isEmpty) {
      _setError("Please enter email and password");

      return false;
    }

    DioHelper.setToken("");

    ref.read(tokenProvider.notifier).state = null;

    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final request = LoginRequest(
        email: state.email,
        password: state.password,
      );

      final response = await _authService.login(request: request);

      DioHelper.setToken(response.token);

      ref.read(tokenProvider.notifier).state = response.token;

      return true;
    } catch (e) {
      _setError(e.toString());

      return false;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
