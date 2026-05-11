import 'package:flutter/material.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';
import 'package:smart_university_app/features/results/presentation/views/widgets/add_grades_body.dart';

class AddGradesScreen extends StatelessWidget {
  const AddGradesScreen({super.key, required this.course});
  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AddGradesBody(course: course,));
  }
}

