import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/quiz/presentation/views/widgets/custom_field.dart';

class QuizInfoSection extends StatelessWidget {
  const QuizInfoSection({
    super.key,
    required this.titleController,
    required this.gradeController,
    required this.durationController,
    required this.dateController,
    required this.onPickDate,
  });

  final TextEditingController titleController;
  final TextEditingController gradeController;
  final TextEditingController durationController;
  final TextEditingController dateController;
  final VoidCallback onPickDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomField(label: "Quiz Title", controller: titleController),
        SizedBox(height: 12.h),
        CustomField(
          label: "Date-time",
          controller: dateController,
          readOnly: true,
          suffixIcon: const Icon(Icons.calendar_today),
          onTap: onPickDate,
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: CustomField(
                label: "Total Grade",
                controller: gradeController,
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: CustomField(
                label: "Duration (Minutes)",
                controller: durationController,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

