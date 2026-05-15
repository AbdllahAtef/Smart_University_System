import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class AnswerItem extends StatelessWidget {
  final String label;
  final String text;
  final bool isSelected;

  const AnswerItem({
    super.key,
    required this.label,
    required this.text,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isSelected ? const Color(0xff8B2072) : Colors.grey.shade300,
          width: 1.5.w,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16.r,
            backgroundColor: isSelected
                ? const Color(0xff8B2072)
                : Colors.grey.shade200,
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xff8B2072),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyles.textstyle18.copyWith(
                color: isSelected ? const Color(0xff8B2072) : Colors.black,
              ),
            ),
          ),
          if (isSelected)
            const Icon(Icons.check_circle, color: Color(0xff8B2072)),
        ],
      ),
    );
  }
}


