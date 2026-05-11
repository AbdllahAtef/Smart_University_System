import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/widgets/custom_elevated_button.dart';
import 'package:smart_university_app/features/attendance/presentation/manager/attendence_provider.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';
import 'package:smart_university_app/features/course/presentation/manager/courses_provider.dart';
import 'package:smart_university_app/features/course/presentation/views/widgets/course_header.dart';
import 'package:smart_university_app/features/results/presentation/helpers/submit_grades_helper.dart';
import 'package:smart_university_app/features/results/presentation/views/widgets/add_grades_list_view.dart';
import 'package:smart_university_app/features/results/presentation/views/widgets/grades_dropdown.dart';

class AddGradesBody extends ConsumerStatefulWidget {
  const AddGradesBody({super.key, required this.course});

  final CourseModel course;

  @override
  ConsumerState<AddGradesBody> createState() => _AddGradesBodyState();
}

class _AddGradesBodyState extends ConsumerState<AddGradesBody> {
  final Map<int, TextEditingController> controllers = {};

  TextEditingController getController(int id) {
    if (controllers.containsKey(id)) {
      return controllers[id]!;
    }

    final controller = TextEditingController();

    controllers[id] = controller;

    return controller;
  }

  @override
  void dispose() {
    for (final controller in controllers.values) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final studentsAsync = ref.watch(courseStudentsProvider(widget.course.id));

    final isLoading = ref.watch(isSubmittingProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CourseHeader(title: "Add Grades"),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [GradesDropdown()],
          ),
        ),

        const SizedBox(height: 16),

        studentsAsync.when(
          data: (students) {
            for (final student in students) {
              getController(student.id);
            }

            return AddGradesListView(
              studentsAsync: AsyncData(students),
              controllers: controllers,
            );
          },
          loading: () {
            return const Expanded(
              child: Center(child: CircularProgressIndicator()),
            );
          },
          error: (e, _) {
            return Expanded(child: Center(child: Text("Error: $e")));
          },
        ),

        Padding(
          padding: const EdgeInsets.all(16),
          child: CustomElevatedButton(
            onPressed: isLoading
                ? null
                : () async {
                    await ResultsSubmitHelper.submitGradesHelper(
                      context: context,
                      ref: ref,
                      courseId: widget.course.id,
                      controllers: controllers,
                    );
                  },
            text: isLoading ? "Loading..." : "Submit Grades",
          ),
        ),
      ],
    );
  }
}
