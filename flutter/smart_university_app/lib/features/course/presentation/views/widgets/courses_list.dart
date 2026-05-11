import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/course/presentation/manager/search_provider.dart';
import 'package:smart_university_app/features/course/presentation/views/screens/courses_details_screen.dart';
import 'package:smart_university_app/features/course/presentation/views/widgets/course_list_item.dart';
import 'package:smart_university_app/features/results/presentation/views/screens/grades_distrbution_screen.dart';


class CoursesList extends ConsumerWidget {
  const CoursesList({super.key, this.isgrades = false});
  final bool isgrades;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesAsync = ref.watch(filteredCoursesProvider);
    return coursesAsync.when(
      data: (courses) {
        if (courses.isEmpty) {
          return const Center(child: Text("No courses Registered"));
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return CourseListItem(
              title: course.name,
              onTap: () {
                isgrades
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              GradesDistrbutionScreen(course: course),
                        ),
                      )
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CoursesDetailsScreen(course: course),
                        ),
                      );
              },
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text("Error: $e")),
    );
  }
}

