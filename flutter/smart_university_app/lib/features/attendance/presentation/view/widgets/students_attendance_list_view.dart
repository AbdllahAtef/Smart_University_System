import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/attendance/data/model/attendence_model.dart';
import 'package:smart_university_app/features/attendance/presentation/view/widgets/student_attendence_item.dart';
import 'package:smart_university_app/features/course/data/model/course_students_model.dart';


class StudentsAttendanceListView extends ConsumerWidget {
  const StudentsAttendanceListView({
    super.key,
    required this.students,
    required this.attendance,
  });

  final List<CourseStudentsModel> students;

  final AttendanceState attendance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];

        return StudentAttendenceItem(student: student, attendance: attendance);
      },
    );
  }
}
