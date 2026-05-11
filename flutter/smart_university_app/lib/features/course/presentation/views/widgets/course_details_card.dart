import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class CourseDetailsCard extends StatelessWidget {
  final String title;
  final String description;

  const CourseDetailsCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: const Color(0xffF4F3F3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: const Color(0xFF8B2072),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.book_outlined, color: Colors.white, size: 28.sp),
          ),
          SizedBox(height: 16.h),
          Text(
            title,
            style: TextStyles.textstyle24.copyWith(
              color: const Color(0xFF8B2072),
              fontWeight: FontWeight.w800,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          Text(
            description,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyles.textstyle16.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
