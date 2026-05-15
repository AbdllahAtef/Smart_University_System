import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';
import 'package:smart_university_app/features/assignment/presentation/views/widgets/upload_card.dart';

class UploadSection extends StatelessWidget {
  const UploadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Text(
            "File upload",
            style: TextStyles.textstyle16.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        SizedBox(height: 12.h),

        const UploadCard(),
      ],
    );
  }
}
