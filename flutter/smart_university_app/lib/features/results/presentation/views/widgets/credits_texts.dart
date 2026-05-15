import 'package:flutter/material.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';


class CreditsTexts extends StatelessWidget {
  const CreditsTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "OverAll CGPA: 3.75",
            style: TextStyles.textstyle14.copyWith(color: Colors.black87),
          ),
          const SizedBox(height: 8),
          Text(
            "Credits Earned: 50/150",
            style: TextStyles.textstyle14.copyWith(color: Colors.black87),
          ),
        ],
      ),
    );
  }
}


