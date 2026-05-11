import 'package:flutter/material.dart';
import 'package:smart_university_app/features/home/presentation/views/screens/home_screen.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';
import 'package:smart_university_app/core/widgets/custom_elevated_button.dart';

class QuizResultView extends StatelessWidget {
  final int score;
  final int total;

  const QuizResultView({super.key, required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Quiz Finished !",
            style: TextStyles.textstyle24.copyWith(
              color: const Color(0xFF8B2072),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Your Score: $score / $total",
            style: TextStyles.textstyle20.copyWith(color: Colors.black87),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: CustomElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeView()),
                  (route) => false,
                );
              },
              text: 'Finish',
            ),
          ),
        ],
      ),
    );
  }
}


