import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/home/data/model/subject_model.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({super.key, required this.subject});

  final SubjectModel subject;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 87.w,
        height: 105.h,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0XFF8B2072), width: 3),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(subject.image, fit: BoxFit.cover),
            ),
            Positioned(
              bottom: 8,
              left: 6,
              right: 8,
              child: Text(
                subject.title,
                style: TextStyles.textstyle8,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


