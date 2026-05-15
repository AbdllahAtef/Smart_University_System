import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/auth/presentation/manager/logout_controller.dart';
import 'package:smart_university_app/features/auth/presentation/views/screens/sign_in_screen.dart';

void logoutUser({required BuildContext context, required WidgetRef ref}) {
  ref.read(logoutControllerProvider).logout();

  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (_) => const SignInScreen()),
    (route) => false,
  );
}
