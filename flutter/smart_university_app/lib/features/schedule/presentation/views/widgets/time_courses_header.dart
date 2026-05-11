import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class TimeCoursesHeader extends StatelessWidget {
  const TimeCoursesHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Time",
            style: TextStyles.textstyle16.copyWith(
              color: Colors.grey,
            ),
          ),
          SizedBox(width: 16.w),
          Text(
            "course",
            style: TextStyles.textstyle16.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}


