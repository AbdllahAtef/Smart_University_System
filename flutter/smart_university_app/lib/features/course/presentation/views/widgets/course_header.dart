import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';
import 'package:smart_university_app/features/attendance/presentation/manager/attendence_provider.dart';
import 'package:smart_university_app/features/quiz/presentation/views/widgets/quiz_timer_widget.dart';

class CourseHeader extends ConsumerWidget {
  const CourseHeader({
    super.key,
    required this.title,
    this.isquiz = false,
    this.isAttendance = false,
    this.students = const [],
  });

  final String title;
  final bool isquiz;
  final bool isAttendance;
  final List<int> students;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendance = ref.watch(attendanceProvider);

    final allSelected =
        students.isNotEmpty &&
        students.every((id) => attendance.attendance[id] == true);

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios),
            ),
            Text(
              title,
              style: TextStyles.textstyle20.copyWith(
                color: const Color(0xFF8B2072),
              ),
            ),
            if (isquiz)
              const QuizTimerWidget()
            else if (isAttendance)
              Checkbox(
                value: allSelected,
                onChanged: (value) {
                  ref
                      .read(attendanceProvider.notifier)
                      .toggleAll(students, value ?? false);
                },
              )
            else
              const Icon(Icons.more_vert),
          ],
        ),
      ),
    );
  }
}
