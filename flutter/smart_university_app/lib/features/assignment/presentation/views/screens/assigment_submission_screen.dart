import 'package:flutter/material.dart';
import 'package:smart_university_app/features/assignment/data/model/assignments_model.dart';
import 'package:smart_university_app/features/assignment/presentation/views/widgets/assignment_view_body.dart';
class AssigmentSubmissionScreen extends StatelessWidget {
  const AssigmentSubmissionScreen({super.key, required this.assignment});

  final AssignmentModel assignment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AssignmentViewBody(assignment: assignment));
  }
}

