import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/features/auth/presentation/manager/user_id_provider.dart';
import 'package:smart_university_app/features/schedule/data/model/lecture_model.dart';
import 'package:smart_university_app/core/utils/date_utils.dart';
import 'package:smart_university_app/features/schedule/data/services/lecture_service.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';

final selectedDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

final datesProvider = Provider<List<DateTime>>((ref) {
  return generateDates();
});

final studentIdProvider = userIdProvider;

final scheduleServiceProvider = Provider<ScheduleService>((ref) {
  return ScheduleService();
});

final myCoursesProvider = FutureProvider<List<CourseModel>>((ref) async {
  final studentId = ref.watch(studentIdProvider);
  if (studentId == null) return [];
  final service = ref.watch(scheduleServiceProvider);
  return service.getMyCourses(studentId);
});

final allLecturesProvider = FutureProvider<List<LectureModel>>((ref) async {
  final role = ref.watch(userRoleProvider);
  final service = ref.watch(scheduleServiceProvider);

  if (role == 'doctor') {
    return service.getDoctorLectures();
  }
  final studentId = ref.watch(studentIdProvider);

  if (studentId == null) return [];

  return service.getAllLecturesForStudent(studentId);
});

final filteredLecturesProvider = Provider<AsyncValue<List<LectureModel>>>((
  ref,
) {
  final selectedDate = ref.watch(selectedDateProvider);
  final lecturesAsync = ref.watch(allLecturesProvider);

  return lecturesAsync.whenData((lectures) {
    final day = selectedDate.weekday % 7;
    return lectures.where((lecture) => lecture.day == day).toList();
  });
});
final lecturesByCourseProvider = FutureProvider.family<List<LectureModel>, int>(
  (ref, courseId) async {
    final service = ref.read(scheduleServiceProvider);
    return service.getLectures(courseId);
  },
);
List<LectureModel> sortLectures(List<LectureModel> lectures) {
  final sorted = [...lectures];

  sorted.sort((a, b) {
    if (a.day != b.day) {
      return a.day.compareTo(b.day);
    }
    return a.startTime.compareTo(b.startTime);
  });

  return sorted;
}
