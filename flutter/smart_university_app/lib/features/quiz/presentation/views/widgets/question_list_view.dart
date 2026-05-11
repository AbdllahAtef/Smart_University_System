import 'package:flutter/material.dart';
import 'package:smart_university_app/features/quiz/data/model/question_form_model.dart';
import 'package:smart_university_app/features/quiz/presentation/views/widgets/question_item_widget.dart';
class QuestionListView extends StatelessWidget {
  const QuestionListView({
    super.key,
    required this.questions,
  });

  final List<QuestionFormModel> questions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (context, index) {
        return QuestionItemWidget(
          index: index,
          q: questions[index],
        );
      },
    );
  }
}

