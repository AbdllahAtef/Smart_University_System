import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/assignment/presentation/manager/assignment_provider.dart';

Future<void> pickFile(WidgetRef ref, BuildContext context) async {
  final isPicking = ref.read(isPickingFileProvider);

  if (isPicking) return;

  ref.read(isPickingFileProvider.notifier).state = true;

  try {
    final result = await FilePicker.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      final pickedFile = result.files.first;

      const maxSize = 25 * 1024 * 1024;  

      if (pickedFile.size > maxSize) {
        ref.read(fileProvider.notifier).state = null;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("File is too large. Max size is 25 MB ❌"),
          ),
        );

        return;
      }
      ref.read(fileProvider.notifier).state = pickedFile;
    }
  } catch (e) {
    debugPrint(e.toString());

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Error while picking file")));
  } finally {
    ref.read(isPickingFileProvider.notifier).state = false;
  }
}
