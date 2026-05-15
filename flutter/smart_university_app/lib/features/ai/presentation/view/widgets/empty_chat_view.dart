import 'package:flutter/material.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class EmptyChatView extends StatelessWidget {
  const EmptyChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "How can I help you today?",
        style: TextStyles.textstyle16.copyWith(color: const Color(0Xff8B2072)),
      ),
    );
  }
}
