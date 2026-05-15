import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_university_app/core/widgets/universal_card.dart';
import 'package:smart_university_app/features/quiz/data/model/quizes_model.dart';

class QuizzesListView extends StatelessWidget {
  final List<QuizModel> quizzes;
  const QuizzesListView({super.key, required this.quizzes});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: quizzes.length,
      itemBuilder: (context, index) {
        final quiz = quizzes[index];
        return UniversalCard(
          title: quiz.title,
          description: "Total Grade: ${quiz.totalGrade}",
          date: DateFormat('MMM d, yyyy • hh:mm a').format(quiz.quizDate),
          extra: "${quiz.durationMinutes} min",
          icon: Icons.quiz,
          color: const Color(0XFF8B2072),
          quiz: quiz,
        );
      },
    );
  }
}

