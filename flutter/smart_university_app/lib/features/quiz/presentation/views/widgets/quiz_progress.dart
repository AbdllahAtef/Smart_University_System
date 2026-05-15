import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class QuizProgress extends StatelessWidget {
  final int current;
  final int total;

  const QuizProgress({super.key, required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    final progress = current / total;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Question $current of $total",
          style: TextStyles.textstyle14.copyWith(
            color: const Color(0xFF85727C),
          ),
        ),
        SizedBox(height: 6.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Quiz",
              style: TextStyles.textstyle16.copyWith(
                color: const Color(0xFF8B2072),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${(progress * 100).toInt()}%",
              style: TextStyles.textstyle18.copyWith(
                color: const Color(0xFF8B2072),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        LinearProgressIndicator(
          value: progress,
          borderRadius: BorderRadius.circular(8.r),
          backgroundColor: Colors.grey.shade300,
          color: const Color(0xFF8B2072),
          minHeight: 8.h,
        ),
      ],
    );
  }
}


