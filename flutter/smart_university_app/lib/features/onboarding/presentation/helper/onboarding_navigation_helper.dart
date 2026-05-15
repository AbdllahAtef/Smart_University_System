import 'package:flutter/material.dart';
import 'package:smart_university_app/features/auth/presentation/views/screens/sign_in_screen.dart';

void openSignIn(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => const SignInScreen()),
  );
}
void nextOnBoardingPage({
  required BuildContext context,
  required PageController controller,
  required bool isLast,
}) {
  if (isLast) {
    openSignIn(context);

    return;
  }

  controller.nextPage(
    duration: const Duration(milliseconds: 200),
    curve: Curves.linear,
  );
}
