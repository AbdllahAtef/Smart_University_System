import 'package:flutter/material.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class CardContent extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String? extra;
  final Color color;

  const CardContent({super.key, 
    required this.title,
    required this.description,
    required this.date,
    this.extra,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.textstyle16.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: TextStyles.textstyle12.copyWith(color: Colors.grey),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Text(
              date,
              style: TextStyles.textstyle12.copyWith(color: Colors.grey),
            ),
            if (extra != null) ...[
              const SizedBox(width: 8),
              Text(
                extra!,
                style: TextStyles.textstyle12.copyWith(color: color),
              ),
            ],
          ],
        ),
      ],
    );
  }
}


