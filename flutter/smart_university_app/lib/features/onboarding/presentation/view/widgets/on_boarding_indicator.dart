import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/onboarding/presentation/manager/on_boarding_provider.dart';

class OnBoardingIndicator extends ConsumerWidget {
  const OnBoardingIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(onBoardingProvider);
    final list = ref.watch(onBoardingListProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        list.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          height: 6.h,
          width: 109.w,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? const Color(0xFF8B2072)
                : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
