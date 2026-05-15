import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/utils/validator.dart';
import 'package:smart_university_app/features/auth/presentation/manager/login_provider.dart';
import 'package:smart_university_app/features/auth/presentation/manager/states/login_state.dart';
import 'package:smart_university_app/features/home/presentation/views/screens/home_screen.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';
import 'package:smart_university_app/core/widgets/custom_elevated_button.dart';
import 'package:smart_university_app/core/widgets/custom_text_form_field.dart';
import 'package:smart_university_app/features/auth/presentation/views/widgets/sign_up_button.dart';

class SignInWithEmail extends ConsumerWidget {
  SignInWithEmail({super.key});

  final _formKey = GlobalKey<FormState>();

  Future<void> _login(BuildContext context, WidgetRef ref) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final notifier = ref.read(loginProvider.notifier);

    final success = await notifier.login();

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Login failed")));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginProvider);

    final notifier = ref.read(loginProvider.notifier);

    ref.listen<LoginState>(loginProvider, (previous, next) {
      if (next.error != null && next.error != previous?.error) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.error!)));
      }
    });

    return Expanded(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
          ),
          child: Column(
            children: [
              SizedBox(height: 20.h),

              CustomTextFormField(
                isPassword: false,
                hint: 'Email',
                onChanged: notifier.updateEmail,
                validator: Validators.email,
              ),

              SizedBox(height: 10.h),

              CustomTextFormField(
                isPassword: true,
                hint: 'Password',
                onChanged: notifier.updatePassword,
                validator: Validators.loginPassword,
              ),

              SizedBox(height: 50.h),

              CustomElevatedButton(
                onPressed: state.isLoading ? null : () => _login(context, ref),
                text: 'Log In',
              ),

              SizedBox(height: 20.h),

              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: TextStyles.textstyle16.copyWith(
                    color: const Color(0xFF8B2072),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SignUpButton(),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
