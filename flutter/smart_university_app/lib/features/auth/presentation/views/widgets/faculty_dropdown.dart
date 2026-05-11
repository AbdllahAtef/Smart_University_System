import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/auth/data/models/faculty_model.dart';
import 'package:smart_university_app/features/auth/presentation/manager/create_account_provider.dart';

class FacultyDropdown extends ConsumerWidget {
  final Faculty? selectedFaculty;
  final Function(Faculty?) onChanged;

  const FacultyDropdown({
    super.key,
    required this.selectedFaculty,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final facultiesAsync = ref.watch(facultiesProvider);

    return facultiesAsync.when(
      data: (faculties) {
        return DropdownButtonFormField<Faculty>(
          value: selectedFaculty,
          hint: const Text("Choose your faculty"),
          items: faculties.map((faculty) {
            return DropdownMenuItem(value: faculty, child: Text(faculty.name));
          }).toList(),
          onChanged: onChanged,
          validator: (value) {
            if (value == null) {
              return 'Please select a faculty';
            }
            return null;
          },
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (e, _) => Text('Error: $e'),
    );
  }

  // UnderlineInputBorder outlineBorder() {
  //   return UnderlineInputBorder(
  //     borderSide: BorderSide(color: const Color(0xFF949494).withOpacity(0.5)),
  //   );
  // }
}


