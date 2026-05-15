import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/utils/date_utils.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class DeadlineCard extends StatelessWidget {
  final DateTime deadline;

  const DeadlineCard({super.key, required this.deadline});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xFF8E2A7B),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Icon(Icons.calendar_today_outlined, color: Colors.white, size: 20.sp),

          SizedBox(height: 6.h),

          Text("SUBMISSION DEADLINE", style: TextStyles.textstyle12),

          SizedBox(height: 6.h),

          Text(deadline.formattedDate, style: TextStyles.textstyle18),

          SizedBox(height: 4.h),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Text(deadline.formattedTime, style: TextStyles.textstyle12),
          ),
        ],
      ),
    );
  }
}



