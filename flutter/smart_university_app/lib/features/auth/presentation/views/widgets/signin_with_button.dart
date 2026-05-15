import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class SigninWithButton extends StatelessWidget {
  const SigninWithButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
  });
  final VoidCallback onPressed;
  final String text;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 227, 227, 227),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          minimumSize: Size(double.infinity, 52.h),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon,
            SizedBox(width: 40.w),
            Text(
              text,
              style: TextStyles.textstyle16.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}


