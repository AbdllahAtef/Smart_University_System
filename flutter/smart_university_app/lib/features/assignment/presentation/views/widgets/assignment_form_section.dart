import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/quiz/presentation/views/widgets/custom_field.dart';

class AssignmentFormSection extends StatelessWidget {
  const AssignmentFormSection({
    super.key,
    required this.titleController,
    required this.descController,
    required this.dateController,
    required this.gradeController,
    required this.onPickDate,
  });

  final TextEditingController titleController;

  final TextEditingController descController;

  final TextEditingController dateController;

  final TextEditingController gradeController;

  final VoidCallback onPickDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomField(label: "Assignment Title", controller: titleController),

        SizedBox(height: 12.h),

        CustomField(
          label: "Description",
          controller: descController,
          maxLines: 3,
        ),

        SizedBox(height: 12.h),

        Row(
          children: [
            Expanded(
              child: CustomField(
                label: "Deadline Date",
                controller: dateController,
                readOnly: true,
                suffixIcon: const Icon(Icons.calendar_today),
                onTap: onPickDate,
              ),
            ),

            SizedBox(width: 10.w),

            Expanded(
              child: CustomField(
                label: "Max Grade",
                controller: gradeController,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
