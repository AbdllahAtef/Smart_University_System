import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/results/presentation/manager/results_provider.dart';
import 'package:smart_university_app/core/styles/app_styles.dart';

class GradesDropdown extends ConsumerWidget {
  const GradesDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final types = ref.watch(gradesTypesProvider);
    final selected = ref.watch(selectedTypeProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Grades:  ",
          style: TextStyles.textstyle18.copyWith(color: Colors.black),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            style: TextStyles.textstyle18.copyWith(
              color: const Color(0XFF8B2072),
            ),
            value: selected,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: types.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  style: const TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              ref.read(selectedTypeProvider.notifier).state = value!;
            },
          ),
        ),
      ],
    );
  }
}


