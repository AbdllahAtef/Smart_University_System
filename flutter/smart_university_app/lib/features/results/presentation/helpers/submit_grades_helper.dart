import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/attendance/presentation/manager/attendence_provider.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';
import 'package:smart_university_app/features/results/data/model/add_grades_model.dart';
import 'package:smart_university_app/features/results/data/model/grading_schema_model.dart';
import 'package:smart_university_app/features/results/presentation/manager/results_provider.dart';
import 'package:smart_university_app/features/results/presentation/views/screens/add_grades_screen.dart';

class ResultsSubmitHelper {
  static Future<void> submitGradesHelper({
    required BuildContext context,
    required WidgetRef ref,
    required int courseId,
    required Map<int, TextEditingController> controllers,
  }) async {
    final selectedType = ref.read(selectedTypeProvider);

    final service = ref.read(gradesServiceProvider);

    try {
      ref.read(isSubmittingProvider.notifier).state = true;

      final requests = controllers.entries.where((e) {
        return e.value.text.isNotEmpty;
      });

      await Future.wait(
        requests.map((entry) {
          final studentId = entry.key;

          final grade = int.parse(entry.value.text);

          final model = SubmitGradeModel(
            studentId: studentId,
            courseId: courseId,
            grade: grade,
            type: selectedType,
          );

          return service.submitGrade(model);
        }),
      );

      if (!context.mounted) return;

      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Grades Submitted Successfully")),
      );
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      ref.read(isSubmittingProvider.notifier).state = false;
    }
  }

  static Future<void> submitGradingSchemeHelper({
    required BuildContext context,
    required WidgetRef ref,
    required int courseId,
    required CourseModel course,
    required TextEditingController midtermController,
    required TextEditingController finalController,
  }) async {
    final service = ref.read(gradesServiceProvider);

    try {
      final midterm = int.parse(midtermController.text);

      final finalGrade = int.parse(finalController.text);

      final model = GradingSchemeModel(
        maxMidterm: midterm,
        maxFinal: finalGrade,
      );

      await service.updateGradingScheme(courseId: courseId, model: model);

      if (!context.mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Saved Successfully")));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => AddGradesScreen(course: course)),
      );
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
