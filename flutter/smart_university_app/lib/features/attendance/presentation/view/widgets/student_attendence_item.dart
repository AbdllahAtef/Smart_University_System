import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';
import 'package:smart_university_app/features/attendance/data/model/attendence_model.dart';
import 'package:smart_university_app/features/attendance/presentation/manager/attendence_provider.dart';
import 'package:smart_university_app/features/course/data/model/course_students_model.dart';

class StudentAttendenceItem extends ConsumerWidget {
  const StudentAttendenceItem({
    super.key,
    required this.student,
    required this.attendance,
  });

  final CourseStudentsModel student;
  final AttendanceState attendance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: Colors.purple.shade100,
            child: Text(
              student.fullName.substring(0, 2).toUpperCase(),
              style: TextStyle(
                color: const Color(0xff8B2072),
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              student.fullName,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.textstyle16.copyWith(
                fontSize: 14.sp,
                color: Colors.black,
              ),
            ),
          ),
          Transform.scale(
            scale: 1.5,
            child: Checkbox(
              value: attendance.attendance[student.id] ?? false,
              onChanged: (value) {
                ref
                    .read(attendanceProvider.notifier)
                    .toggle(student.id, value ?? false);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
