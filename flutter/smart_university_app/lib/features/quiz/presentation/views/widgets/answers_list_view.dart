import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/quiz/data/model/question_model.dart';
import 'package:smart_university_app/features/quiz/presentation/manager/quiz_provider.dart';
import 'package:smart_university_app/features/quiz/presentation/views/widgets/answer_item.dart';

class AnswersListView extends ConsumerWidget {
  const AnswersListView({super.key, required this.question});

  final QuestionModel question;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final answers = ref.watch(quizProvider.select((state) => state.answers));

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: question.options.length,
      itemBuilder: (context, index) {
        final option = question.options[index];

        final isSelected = answers[question.id] == option.id;

        return GestureDetector(
          onTap: () {
            ref
                .read(quizProvider.notifier)
                .selectAnswer(question.id, option.id);
          },
          child: AnswerItem(
            label: String.fromCharCode(65 + index),
            text: option.text,
            isSelected: isSelected,
          ),
        );
      },
    );
  }
}
