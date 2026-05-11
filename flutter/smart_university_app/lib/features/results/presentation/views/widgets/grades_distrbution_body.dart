import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';
import 'package:smart_university_app/core/widgets/custom_elevated_button.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';
import 'package:smart_university_app/features/course/presentation/views/widgets/course_header.dart';
import 'package:smart_university_app/features/quiz/presentation/views/widgets/custom_field.dart';
import 'package:smart_university_app/features/results/presentation/helpers/submit_grades_helper.dart';


class GradesDistrbutionBody extends ConsumerStatefulWidget {
  const GradesDistrbutionBody({super.key, required this.course});

  final CourseModel course;

  @override
  ConsumerState<GradesDistrbutionBody> createState() =>
      _GradesDistrbutionBodyState();
}

class _GradesDistrbutionBodyState extends ConsumerState<GradesDistrbutionBody> {
  late TextEditingController midtermController;

  late TextEditingController finalController;

  @override
  void initState() {
    super.initState();

    midtermController = TextEditingController();

    finalController = TextEditingController();
  }

  @override
  void dispose() {
    midtermController.dispose();

    finalController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CourseHeader(title: "Grades Distribution"),

          SizedBox(height: 16.h),

          Text(
            "Define grading structure",
            style: TextStyles.textstyle16.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

          SizedBox(height: 16.h),

          CustomField(
            label: "Class Work Grades",
            controller: midtermController,
            keyboardType: TextInputType.number,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(Icons.percent, color: Colors.grey.shade700),
            ),
          ),

          SizedBox(height: 16.h),

          CustomField(
            label: "Final Exam Grades",
            controller: finalController,
            keyboardType: TextInputType.number,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(Icons.percent, color: Colors.grey.shade700),
            ),
          ),

          const Spacer(),

          CustomElevatedButton(
            text: "Save Distribution",
           onPressed: () async {
              await ResultsSubmitHelper.submitGradingSchemeHelper(
                context: context,
                ref: ref,
                courseId: widget.course.id,
                course: widget.course,
                midtermController: midtermController,
                finalController: finalController,
              );
            },
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
