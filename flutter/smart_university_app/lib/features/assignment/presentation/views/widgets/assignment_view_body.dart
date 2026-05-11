import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/widgets/custom_elevated_button.dart';
import 'package:smart_university_app/features/assignment/data/model/assignments_model.dart';
import 'package:smart_university_app/features/assignment/presentation/manager/assignment_provider.dart';
import 'package:smart_university_app/features/assignment/presentation/views/widgets/deadline_card.dart';
import 'package:smart_university_app/features/assignment/presentation/views/widgets/submission_instructions_card.dart';
import 'package:smart_university_app/features/assignment/presentation/views/widgets/task_card.dart';
import 'package:smart_university_app/features/assignment/presentation/views/widgets/upload_section.dart';
import 'package:smart_university_app/features/course/presentation/views/widgets/course_header.dart';
import 'package:smart_university_app/features/assignment/presentation/helper/error_message_helper.dart';

class AssignmentViewBody extends ConsumerWidget {
  const AssignmentViewBody({super.key, required this.assignment});

  final AssignmentModel assignment;

  Future<void> _submitAssignment(
    WidgetRef ref,
    BuildContext context,
    AssignmentModel assignment,
  ) async {
    final file = ref.read(fileProvider);

    if (file == null) return;

    try {
      await ref
          .read(assignmentSubmissionServiceProvider)
          .submitAssignment(assignmentId: assignment.id, file: file);

      ref.read(fileProvider.notifier).state = null;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Submitted successfully ✅")));

      Navigator.pop(context);
    } catch (e) {
      final message = getErrorMessage(e);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));

      ref.read(fileProvider.notifier).state = null;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final file = ref.watch(fileProvider);

    return Column(
      children: [
        const CourseHeader(title: 'Assignment Submission'),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TaskCard(assignment: assignment),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: DeadlineCard(deadline: assignment.dueDate),
                ),
                const SizedBox(height: 20),
                const SubmissionInstructionsCard(),
                const SizedBox(height: 20),
                const UploadSection(),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h),
          child: CustomElevatedButton(
            text: "Submit Assignment",
            onPressed: file == null
                ? null
                : () => _submitAssignment(ref, context, assignment),
          ),
        ),
      ],
    );
  }
}
