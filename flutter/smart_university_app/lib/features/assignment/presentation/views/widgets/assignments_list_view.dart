import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_university_app/core/widgets/universal_card.dart';
import 'package:smart_university_app/features/assignment/data/model/assignments_model.dart';

class AssignmentsListView extends StatelessWidget {
  const AssignmentsListView({super.key, required this.assignments});

  final List<AssignmentModel> assignments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: assignments.length,
      itemBuilder: (context, index) {
        final assignment = assignments[index];

        return UniversalCard(
          title: assignment.title,
          description: assignment.description,
          date: DateFormat('MMM d, yyyy').format(assignment.dueDate),
          extra: "Max: ${assignment.maxGrade}",
          icon: Icons.assignment,
          color: const Color(0XFF8B2072),
          assignment: assignment,
        );
      },
    );
  }
}
