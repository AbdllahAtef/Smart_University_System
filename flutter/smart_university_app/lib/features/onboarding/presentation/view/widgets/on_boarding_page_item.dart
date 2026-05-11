import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';
import 'package:smart_university_app/features/onboarding/data/model/on_boarding_model.dart';

class OnBoardingPageItem extends StatelessWidget {
  const OnBoardingPageItem({super.key, required this.item});

  final OnBoardingModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(item.image, height: 250.h),

        SizedBox(height: 20.h),

        Text(
          item.title,
          textAlign: TextAlign.center,
          style: TextStyles.textstyle24.copyWith(color: Colors.black),
        ),

        SizedBox(height: 12.h),

        Text(
          item.description,
          textAlign: TextAlign.center,
          style: TextStyles.textstyle16.copyWith(color: Colors.black),
        ),

        SizedBox(height: 50.h),
      ],
    );
  }
}
