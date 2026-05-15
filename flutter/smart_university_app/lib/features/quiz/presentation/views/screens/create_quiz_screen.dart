import 'package:flutter/material.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';
import 'package:smart_university_app/features/quiz/presentation/views/widgets/create_quiz_body.dart';

class CreateQuizScreen extends StatelessWidget {
  final CourseModel course;
  const CreateQuizScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CreateQuizBody(course: course)),
    );
  }
}

