import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/assets/app_assets.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';
import 'package:smart_university_app/features/auth/presentation/views/widgets/sign_in_with_email.dart';
import 'package:smart_university_app/features/auth/presentation/views/widgets/signin_with_button.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 100.h),
        Text(
          'Welcome Back!\nSign in to continue!',
          style: TextStyles.textstyle24.copyWith(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 50.h),
        SigninWithButton(
          onPressed: () {},
          text: 'Log in with Google',
          icon: Image.asset(AppAssets.google, width: 24.w, height: 24.h),
        ),
        SizedBox(height: 20.h),
        SigninWithButton(
          onPressed: () {},
          text: 'Log in with Facebook',
          icon: Image.asset(AppAssets.facebook, width: 24.w, height: 24.h),
        ),
        SizedBox(height: 40.h),
        Text(
          'or',
          style: TextStyles.textstyle20.copyWith(
            color: const Color(0xFF949494).withOpacity(0.5),
            fontWeight: FontWeight.w300,
          ),
        ),
         SignInWithEmail(),
      ],
    );
  }
}
