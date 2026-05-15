import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/assignment/presentation/views/widgets/instruction_item.dart';

class SubmissionInstructionsCard extends StatelessWidget {
  const SubmissionInstructionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: const Color(0xffF5F7FA),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, size: 20.sp),
              SizedBox(width: 8.w),
              Text(
                "Submission Instructions",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          const InstructionItem(
            number: "1",
            text: "Files must be in PDF or PPTX format",
          ),
          SizedBox(height: 10.h),

          const InstructionItem(
            number: "2",
            text:
                "Ensure all used resources are included at the end of the presentation.",
          ),
          SizedBox(height: 10.h),

          const InstructionItem(
            number: "3",
            text: "File size must not exceed 25 MB.",
          ),
        ],
      ),
    );
  }
}

