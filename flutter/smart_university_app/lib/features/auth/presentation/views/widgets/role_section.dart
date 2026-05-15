import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/auth/presentation/manager/create_account_provider.dart';
import 'package:smart_university_app/features/auth/presentation/views/widgets/role_selector.dart';

class RoleSection extends ConsumerWidget {
  const RoleSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createAccountProvider);

    final notifier = ref.read(createAccountProvider.notifier);

    return FormField<String>(
      initialValue: state.role,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a role';
        }

        return null;
      },
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoleSelector(
              selectedRole: field.value ?? '',
              onChanged: (value) {
                field.didChange(value);

                notifier.changeRole(value);
              },
            ),

            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  field.errorText!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        );
      },
    );
  }
}
