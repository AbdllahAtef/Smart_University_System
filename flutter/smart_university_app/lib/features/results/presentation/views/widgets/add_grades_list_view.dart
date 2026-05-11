import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/course/data/model/course_students_model.dart';
import 'package:smart_university_app/features/results/presentation/manager/results_provider.dart';
import 'package:smart_university_app/features/results/presentation/views/widgets/student_grade_item.dart';

class AddGradesListView extends ConsumerWidget {
  const AddGradesListView({
    super.key,
    required this.studentsAsync,
    required this.controllers,
  });

  final AsyncValue<List<CourseStudentsModel>> studentsAsync;

  final Map<int, TextEditingController> controllers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: studentsAsync.when(
        data: (students) {
          final selectedType = ref.watch(selectedTypeProvider);

          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];

              return StudentGradeItem(
                name: student.fullName,
                code: student.id,
                selectedType: selectedType,
                controller: controllers[student.id]!,
              );
            },
          );
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
        error: (e, _) {
          return Center(child: Text("Error: $e"));
        },
      ),
    );
  }
}
