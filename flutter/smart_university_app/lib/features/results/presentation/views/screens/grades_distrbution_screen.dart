import 'package:flutter/material.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';
import 'package:smart_university_app/features/results/presentation/views/widgets/grades_distrbution_body.dart';


class GradesDistrbutionScreen extends StatelessWidget {
  const GradesDistrbutionScreen({super.key, required this.course});
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: GradesDistrbutionBody(course: course)),
    );
  }
}

