import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/schedule/data/model/lecture_model.dart';
import 'package:smart_university_app/features/schedule/presentation/manager/lecture_provider.dart';
import 'package:smart_university_app/features/schedule/presentation/manager/schedule_provider.dart';

class ScheduleHelper {
  static Future<void> deleteLecture({
    required WidgetRef ref,
    required LectureModel lecture,
    required int courseId,
  }) async {
    final isLocal = lecture.id == null;

    if (isLocal) {
      ref.read(localLecturesProvider.notifier).removeLecture(lecture);
    } else {
      await ref.read(scheduleServiceProvider).deleteLecture(lecture.id!);

      ref.invalidate(lecturesByCourseProvider(courseId));
    }
  }
}
