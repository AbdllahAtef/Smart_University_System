import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class BottomQuizButtons extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onPrev;
  final bool isLast;
  final bool isSubmitting;

  const BottomQuizButtons({
    super.key,
    required this.onNext,
    required this.onPrev,
    required this.isLast,
    required this.isSubmitting,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32, top: 16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: onPrev,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF85727C)),
                padding: EdgeInsets.symmetric(vertical: 14.h),
              ),
              child: Text(
                "Previous",
                style: TextStyles.textstyle16.copyWith(
                  color: const Color(0xFF85727C),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: isSubmitting ? null : onNext,

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B2072),

                padding: EdgeInsets.symmetric(vertical: 14.h),
              ),

              child: Text(
                isSubmitting
                    ? "Submitting..."
                    : isLast
                    ? "Submit Quiz"
                    : "Next Question",

                style: TextStyles.textstyle16.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
