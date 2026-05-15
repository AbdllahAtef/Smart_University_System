import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/auth/presentation/views/widgets/sign_in_body.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(child: SignInBody()),
    );
  }
}
