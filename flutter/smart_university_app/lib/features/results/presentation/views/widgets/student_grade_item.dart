import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class StudentGradeItem extends StatelessWidget {
  final String name;
  final int code;
  final TextEditingController controller;
  final String selectedType;

  const StudentGradeItem({
    super.key,
    required this.name,
    required this.controller,
    required this.code,
    required this.selectedType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xfff5f7fb),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyles.textstyle18.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 4),
                Text(
                  "ID: $code",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Text(
            selectedType == "Midterm"
                ? "Add Midterm =>\t\t"
                : "Add Final =>\t\t",
            style: TextStyles.textstyle16.copyWith(color: Colors.black),
          ),
          SizedBox(
            width: 50.w,
            height: 30.h,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


