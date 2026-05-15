import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';
import 'package:smart_university_app/features/assignment/data/model/assignments_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.assignment});

  final AssignmentModel assignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: Container(
        width: double.infinity,
        height: 200.h,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              assignment.title,
              maxLines: 2,
              style: TextStyles.textstyle24.copyWith(color: Colors.black),
            ),
            Text(
              assignment.description,
              style: TextStyles.textstyle18.copyWith(
                color: const Color(0xff53424C),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


