import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/course/presentation/views/widgets/course_list_item.dart';
import 'package:smart_university_app/features/results/presentation/manager/results_provider.dart';
import 'package:smart_university_app/features/results/presentation/views/widgets/grades_box.dart';

class ResultListView extends ConsumerWidget {
  const ResultListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gradesAsync = ref.watch(allGradesProvider);

    return Expanded(
      child: gradesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text(err.toString())),
        data: (list) {
          if (list.isEmpty) {
            return const Center(child: Text("No grades available"));
          }
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];
              return CourseListItem(
                title: "${item.course.name}\n(${item.course.code})",
                onTap: () {},
                trailing: GradesBox(grades: item.grade),
              );
            },
          );
        },
      ),
    );
  }
}
