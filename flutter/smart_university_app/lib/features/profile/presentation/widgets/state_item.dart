import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class StateItem extends StatelessWidget {
  final String value;
  final String label;

  const StateItem({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyles.textstyle14.copyWith(
            color: const Color(0xFF8B2072),
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),

         SizedBox(height: 6.h),

        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 4.w),
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyles.textstyle12.copyWith(color: Colors.black87),
          ),
        ),
      ],
    );
  }
}


