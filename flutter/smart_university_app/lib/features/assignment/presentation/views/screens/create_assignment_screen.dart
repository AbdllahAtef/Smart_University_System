import 'package:flutter/material.dart';
import 'package:smart_university_app/features/assignment/presentation/views/widgets/create_asignment_body.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';

class CreateAssignmentScreen extends StatelessWidget {
  final CourseModel course;
  const CreateAssignmentScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CreateAsignmentBody(course: course),),
    );
  }
}

