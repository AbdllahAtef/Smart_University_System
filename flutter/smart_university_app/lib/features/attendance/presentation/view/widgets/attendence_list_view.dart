import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/core/widgets/universal_card.dart';
import 'package:smart_university_app/features/attendance/presentation/manager/attendence_provider.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';

class AttendenceListView extends ConsumerWidget {
  const AttendenceListView({super.key, required this.course});

  final CourseModel course;

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(attendanceSessionsProvider);

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null) {
      return Center(child: Text(state.error!));
    }

    final sessions = state.sessions
        .where((e) => e.courseId == course.id)
        .toList();

    return ListView.builder(
      padding: EdgeInsets.zero,

      itemCount: sessions.length,

      itemBuilder: (context, index) {
        final session = sessions[index];

        return UniversalCard(
          title: "Lecture ${index + 1}",

          description: course.name,

          date: session.date.toString(),

          icon: Icons.person_2_outlined,

          color: const Color(0XFF8B2072),

          isAttendance: true,

          course: course,
          
          sessionId: session.sessionId,
        );
      },
    );
  }
}
