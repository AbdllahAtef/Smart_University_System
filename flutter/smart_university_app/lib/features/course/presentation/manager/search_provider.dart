import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/features/course/data/model/course_students_model.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';
import 'package:smart_university_app/features/course/presentation/manager/courses_provider.dart';


final studentSearchProvider = StateProvider<String>((ref) => '');
final filteredStudentsProvider =
    Provider.family<AsyncValue<List<CourseStudentsModel>>, int>((
      ref,
      courseId,
    ) {
      final search = ref.watch(studentSearchProvider).toLowerCase();
      final studentsAsync = ref.watch(courseStudentsProvider(courseId));

      return studentsAsync.whenData((students) {
        if (search.isEmpty) return students;

        return students.where((student) {
          return student.fullName.toLowerCase().contains(search);
        }).toList();
      });
    });

final searchProvider = StateProvider<String>((ref) => '');
final filteredCoursesProvider = Provider<AsyncValue<List<CourseModel>>>((ref) {
  final search = ref.watch(searchProvider).toLowerCase();
  final coursesAsync = ref.watch(coursesByRoleProvider);

  return coursesAsync.whenData((courses) {
    if (search.isEmpty) return courses;

    return courses.where((course) {
      return course.name.toLowerCase().contains(search) ||
          course.code.toLowerCase().contains(search);
    }).toList();
  });
});

