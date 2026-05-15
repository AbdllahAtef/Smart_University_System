import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/features/quiz/data/model/quizes_model.dart';
import 'package:smart_university_app/features/quiz/presentation/helpers/quiz_timer_listner.dart';
import 'package:smart_university_app/features/quiz/presentation/helpers/start_quiz_helper.dart';
import 'package:smart_university_app/features/quiz/presentation/helpers/submit_quiz_helper.dart';
import 'package:smart_university_app/features/quiz/presentation/manager/quiz_provider.dart';
import 'package:smart_university_app/features/quiz/presentation/manager/timer_provider.dart';
import 'package:smart_university_app/features/quiz/presentation/views/screens/quiz_result_screen.dart';
import 'package:smart_university_app/features/quiz/presentation/views/widgets/answers_list_view.dart';
import 'package:smart_university_app/features/quiz/presentation/views/widgets/bottom_quiz_buttons.dart';
import 'package:smart_university_app/features/quiz/presentation/views/widgets/question_card.dart';
import 'package:smart_university_app/features/quiz/presentation/views/widgets/quiz_progress.dart';
import 'package:smart_university_app/features/course/presentation/views/widgets/course_header.dart';
class QuizViewBody extends ConsumerStatefulWidget {
  const QuizViewBody({super.key, required this.quiz});
  final QuizModel quiz;

  @override
  ConsumerState<QuizViewBody> createState() => _QuizBodyState();
}

class _QuizBodyState extends ConsumerState<QuizViewBody> {
  ProviderSubscription<int>? _timerSub;

  late final QuizTimerNotifier timerNotifier;

  @override
  void initState() {
    super.initState();

    timerNotifier = ref.read(quizTimerProvider.notifier);

    Future.microtask(() async {
      final status = await ref.read(quizStatusProvider(widget.quiz.id).future);

      StartQuizHelper.start(ref: ref, status: status);
    });

    _timerSub = ref.listenManual<int>(quizTimerProvider, (
      previous,
      next,
    ) async {
      await QuizTimerListenerHelper.listen(
        context: context,
        ref: ref,
        previous: previous ?? 0,
        next: next,
        quizId: widget.quiz.id,
      );
    });
  }

  @override
  void dispose() {
    _timerSub?.close();
    timerNotifier.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final questionsAsync = ref.watch(questionsProvider(widget.quiz.id));

    final quizState = ref.watch(quizProvider);

    return questionsAsync.when(
      data: (questions) {
        if (questions.isEmpty) {
          return const Center(child: Text("No Questions Found"));
        }

        final currentQuestion = questions[quizState.currentIndex];

        final isLast = quizState.currentIndex == questions.length - 1;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),

          child: Column(
            children: [
              CourseHeader(title: widget.quiz.title, isquiz: true),
              QuizProgress(
                current: quizState.currentIndex + 1,
                total: questions.length,
              ),
              SizedBox(height: 20.h),
              QuestionCard(text: currentQuestion.text),
              Expanded(child: AnswersListView(question: currentQuestion)),
              BottomQuizButtons(
                isLast: isLast,
                isSubmitting: quizState.isSubmitting,
                onPrev: () {
                  ref.read(quizProvider.notifier).previousQuestion();
                },
                onNext: () async {
                  if (quizState.isSubmitting) {
                    return;
                  }
                  if (isLast) {
                    await SubmitQuizHelper.submit(
                      ref: ref,
                      quizId: widget.quiz.id,
                    );
                    if (!context.mounted) {
                      return;
                    }
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QuizResultScreen(quiz: widget.quiz),
                      ),
                    );
                  } else {
                    ref
                        .read(quizProvider.notifier)
                        .nextQuestion(questions.length);
                  }
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        );
      },

      error: (e, _) {
        return Center(child: Text(e.toString()));
      },

      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
