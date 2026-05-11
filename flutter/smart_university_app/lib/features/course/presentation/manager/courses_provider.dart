import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/features/auth/presentation/manager/user_id_provider.dart';
import 'package:smart_university_app/core/services/enrollment_service.dart';
import 'package:smart_university_app/features/course/data/courses_services.dart';
import 'package:smart_university_app/features/course/data/model/course_students_model.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';

final tabIndexProvider = StateProvider<int>((ref) => 0);
final tabsProvider = Provider<List<String>>((ref) {
  final role = ref.watch(userRoleProvider);

  final tabs = ["Assignments", "Quizzes",];

  if (role == "doctor") {
    tabs.add("Attendance");
    tabs.add("Lecture_Date");
  }

  return tabs;
});
final courseServiceProvider = Provider((ref) {
  return CourseService();
});
final coursesProvider = FutureProvider<List<CourseModel>>((ref) async {
  final service = ref.read(courseServiceProvider);
  return service.getCourses();
});

final coursesByRoleProvider = FutureProvider<List<CourseModel>>((ref) async {
  final role = ref.watch(userRoleProvider);
  final service = ref.read(courseServiceProvider);

  if (role == "doctor") {
    return await service.getDoctorCourses();
  } else {
    return await ref.watch(myCoursesProvider.future);
  }
});
final enrollmentServiceProvider = Provider((ref) {
  return EnrollmentService();
});

final myCoursesProvider = FutureProvider<List<CourseModel>>((ref) async {
  final service = ref.read(enrollmentServiceProvider);

  return service.getMyCourses(ref.watch(userIdProvider) ?? 0);
});
final courseStudentsProvider =
    FutureProvider.family<List<CourseStudentsModel>, int>((
      ref,
      courseId,
    ) async {
      final service = ref.read(courseServiceProvider);
      return service.getCourseStudents(courseId);
    });
