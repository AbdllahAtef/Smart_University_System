import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/auth/presentation/manager/user_id_provider.dart';
import 'package:smart_university_app/core/network/dio_helper.dart';
import 'package:smart_university_app/features/home/presentation/manager/home_view_provider.dart';

final logoutControllerProvider = Provider((ref) {
  return LogoutController(ref);
});

class LogoutController {
  final Ref ref;

  LogoutController(this.ref);

  void logout() {
    DioHelper.setToken("");
    ref.read(tokenProvider.notifier).state = null;
    ref.read(bottomNavProvider.notifier).state = 0;
  }
}
