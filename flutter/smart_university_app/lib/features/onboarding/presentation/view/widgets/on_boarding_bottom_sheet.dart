import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';
import 'package:smart_university_app/core/widgets/custom_elevated_button.dart';
import 'package:smart_university_app/features/onboarding/data/model/on_boarding_model.dart';
import 'package:smart_university_app/features/onboarding/presentation/helper/onboarding_navigation_helper.dart';
import 'package:smart_university_app/features/onboarding/presentation/manager/on_boarding_provider.dart';

class OnBoardingBottomSheet extends ConsumerWidget {
  const OnBoardingBottomSheet({
    super.key,
    required this.controller,
    required this.list,
  });

  final PageController controller;

  final List<OnBoardingModel> list;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(onBoardingProvider);

    final isLast = currentPage == list.length - 1;

    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomElevatedButton(
              onPressed: () => nextOnBoardingPage(
                context: context,
                controller: controller,
                isLast: isLast,
              ),
              text: isLast ? 'Start' : 'Next',
            ),

            SizedBox(height: 8.h),

            TextButton(
              onPressed: () => openSignIn(context),
              child: Text(
                'Skip',
                style: TextStyles.textstyle20.copyWith(
                  color: const Color(0xFF8B2072),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
