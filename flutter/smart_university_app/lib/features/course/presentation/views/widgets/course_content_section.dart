import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/assignment/presentation/manager/assignment_provider.dart';
import 'package:smart_university_app/features/attendance/presentation/view/widgets/attendence_list_view.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';
import 'package:smart_university_app/features/quiz/presentation/manager/quiz_provider.dart';
import 'package:smart_university_app/features/assignment/presentation/views/widgets/assignments_list_view.dart';
import 'package:smart_university_app/features/quiz/presentation/views/widgets/quizzes_list_view.dart';
import 'package:smart_university_app/features/schedule/presentation/views/widgets/lectures_list_view.dart';

class CourseContentSection extends ConsumerWidget {
  const CourseContentSection({
    super.key,
    required this.course,
    required this.safeIndex,
  });

  final CourseModel course;

  final int safeIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assignmentsAsync = ref.watch(assignmentsProvider(course.id));

    final quizzesAsync = ref.watch(quizzesProvider(course.id));

    return Expanded(
      child: safeIndex == 0
          ? assignmentsAsync.when(
              data: (assignments) {
                if (assignments.isEmpty) {
                  return const Center(child: Text("No assignments found"));
                }

                return AssignmentsListView(assignments: assignments);
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text("Error: $e")),
            )
          : safeIndex == 1
          ? quizzesAsync.when(
              data: (quizzes) {
                if (quizzes.isEmpty) {
                  return const Center(child: Text("No quizzes available"));
                }

                return QuizzesListView(quizzes: quizzes);
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text("Error: $e")),
            )
          : safeIndex == 2
          ? AttendenceListView(course: course)
          : LecturesListView(course: course)
    );
  }
}
