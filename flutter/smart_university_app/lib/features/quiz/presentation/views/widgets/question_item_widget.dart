import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/quiz/data/model/question_form_model.dart';
import 'package:smart_university_app/features/quiz/presentation/manager/create_quiz_provider.dart';
import 'package:smart_university_app/features/quiz/presentation/views/widgets/custom_field.dart';

class QuestionItemWidget extends ConsumerWidget {
  const QuestionItemWidget({super.key, required this.index, required this.q});

  final int index;
  final QuestionFormModel q;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question ${index + 1}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10.h),

            CustomField(
              label: "Quiz Text",
              initialValue: q.question,
              onChanged: (v) {
                ref
                    .read(createQuestionsProvider.notifier)
                    .updateQuestion(index, v);
              },
            ),

            SizedBox(height: 10.h),

            ...q.options.asMap().entries.map((opt) {
              return Row(
                children: [
                  Expanded(
                    child: CustomField(
                      label: "Option ${opt.key + 1}",
                      initialValue: opt.value,
                      onChanged: (v) {
                        ref
                            .read(createQuestionsProvider.notifier)
                            .updateOption(index, opt.key, v);
                      },
                    ),
                  ),

                  Checkbox(
                    value: q.correctIndex == opt.key,
                    onChanged: (_) {
                      ref
                          .read(createQuestionsProvider.notifier)
                          .selectCorrect(index, opt.key);
                    },
                  ),
                ],
              );
            }),

            SizedBox(height: 10.h),

            CustomField(
              label: "Grade for this question",
              keyboardType: TextInputType.number,
              initialValue: q.grade,
              onChanged: (v) {
                ref
                    .read(createQuestionsProvider.notifier)
                    .updateGrade(index, v);
              },
            ),

            SizedBox(height: 10.h),

            ElevatedButton(
              onPressed: () {
                ref
                    .read(createQuestionsProvider.notifier)
                    .removeQuestion(index);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B2072),
              ),
              child: const Text(
                "- Remove Question",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
