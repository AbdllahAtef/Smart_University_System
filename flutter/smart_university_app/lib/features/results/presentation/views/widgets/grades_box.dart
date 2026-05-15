import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';
import 'package:smart_university_app/features/results/data/model/grades_model.dart';
import 'package:smart_university_app/features/results/presentation/helpers/grades_rank.dart';
import 'package:smart_university_app/features/results/presentation/manager/results_provider.dart';

class GradesBox extends ConsumerWidget {
  const GradesBox({super.key, required this.grades});

  final GradeResponseModel grades;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedType = ref.watch(selectedTypeProvider);
    final isFinal = selectedType == "Final Grades";

    final finalGrade = grades.finalGrade;

    final value = isFinal
        ? (finalGrade == 0 ? 0 : grades.midterm + finalGrade)
        : grades.midterm;

    final maxValue = isFinal
        ? grades.maxMidterm + grades.maxFinal
        : grades.maxMidterm;

    final gradeLetter = (isFinal && finalGrade != 0)
        ? getGradeLetter(value)
        : null;

    return Container(
      width: 60.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$value/$maxValue',
            style: TextStyles.textstyle14.copyWith(
              color: const Color(0XFF8B2072),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4.h),
          if (gradeLetter != null)
            Text(
              gradeLetter,
              style: TextStyles.textstyle12.copyWith(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

          SizedBox(height: 2.h),

          Text(
            isFinal ? "Final" : "Midterm",
            style: TextStyles.textstyle12.copyWith(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
