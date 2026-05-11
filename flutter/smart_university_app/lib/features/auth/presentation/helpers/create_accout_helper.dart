import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/auth/presentation/manager/create_account_provider.dart';

Future<void> submitCreateAccount({
  required BuildContext context,
  required WidgetRef ref,
  required GlobalKey<FormState> formKey,
}) async {
  if (!formKey.currentState!.validate()) {
    return;
  }

  final notifier = ref.read(createAccountProvider.notifier);

  final state = ref.read(createAccountProvider);

  if (state.role == null) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Please select a role")));

    return;
  }

  if (state.role == "Student" && state.faculty == null) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Please select a faculty")));

    return;
  }

  final success = await notifier.register();

  if (success) {
    notifier.resetForm();

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Registered Successfully ✅")));

    Navigator.pop(context);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          ref.read(createAccountProvider).error ?? "Error occurred",
        ),
      ),
    );
  }
}
