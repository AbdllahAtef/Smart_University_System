import 'package:flutter/material.dart';
import 'package:smart_university_app/core/widgets/custom_elevated_button.dart';
import 'package:smart_university_app/features/assignment/presentation/manager/states/create_assignment_state.dart';

class SubmitAssignmentSection extends StatelessWidget {
  final CreateAssignmentState state;

  final VoidCallback onSubmit;

  const SubmitAssignmentSection({
    super.key,
    required this.state,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (state.isLoading) const CircularProgressIndicator(),

        if (state.error != null)
          Text(state.error!, style: const TextStyle(color: Colors.red)),

        CustomElevatedButton(
          onPressed: state.isLoading ? null : onSubmit,
          text: state.isLoading ? "Loading..." : "Create Assignment",
        ),
      ],
    );
  }
}
