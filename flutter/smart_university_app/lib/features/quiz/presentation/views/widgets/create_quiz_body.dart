import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/helpers/pick_date_helper.dart';
import 'package:smart_university_app/core/widgets/custom_elevated_button.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';
import 'package:smart_university_app/features/course/presentation/views/widgets/course_header.dart';
import 'package:smart_university_app/features/quiz/presentation/helpers/submit_create_quiz_helper.dart';
import 'package:smart_university_app/features/quiz/presentation/manager/create_quiz_provider.dart';
import 'package:smart_university_app/features/quiz/presentation/views/widgets/question_list_view.dart';
import 'package:smart_university_app/features/quiz/presentation/views/widgets/quiz_info_section.dart';

class CreateQuizBody extends ConsumerStatefulWidget {
  const CreateQuizBody({super.key, required this.course});

  final CourseModel course;

  @override
  ConsumerState<CreateQuizBody> createState() => _CreateQuizBodyState();
}

class _CreateQuizBodyState extends ConsumerState<CreateQuizBody> {
  final titleController = TextEditingController();

  final gradeController = TextEditingController();

  final durationController = TextEditingController();

  final dateController = TextEditingController();

  DateTime? selectedDate;

  @override
  void dispose() {
    titleController.dispose();

    gradeController.dispose();

    durationController.dispose();

    dateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final questions = ref.watch(createQuestionsProvider);

    final state = ref.watch(createQuizProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          const CourseHeader(title: "Create Quiz"),

          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 20.h),

                QuizInfoSection(
                  titleController: titleController,
                  gradeController: gradeController,
                  durationController: durationController,
                  dateController: dateController,
                  onPickDate: () async {
                    final picked = await pickDate(context);

                    if (picked == null) return;

                    selectedDate = picked;

                    dateController.text =
                        "${picked.year}-${picked.month}-${picked.day}";

                    setState(() {});
                  },
                ),

                SizedBox(height: 20.h),

                QuestionListView(questions: questions),

                SizedBox(height: 12.h),

                ElevatedButton(
                  onPressed: () {
                    ref.read(createQuestionsProvider.notifier).addQuestion();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B2072),
                  ),
                  child: const Text(
                    "+ Add Question",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.h),

          state.isLoading
              ? const CircularProgressIndicator()
              : CustomElevatedButton(
                  onPressed: () {
                    CreateQuizSubmitHelper.submit(
                      context: context,
                      ref: ref,
                      course: widget.course,
                      titleController: titleController,
                      gradeController: gradeController,
                      durationController: durationController,
                      selectedDate: selectedDate,
                    );
                  },
                  text: "Create Quiz",
                ),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
