import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/features/schedule/data/model/lecture_model.dart';
import 'package:smart_university_app/features/schedule/presentation/manager/schedule_provider.dart';

final createLectureProvider =
    StateNotifierProvider<CreateLectureNotifier, AsyncValue<void>>((ref) {
      return CreateLectureNotifier(ref);
    });

class CreateLectureNotifier extends StateNotifier<AsyncValue<void>> {
  final Ref ref;

  CreateLectureNotifier(this.ref) : super(const AsyncData(null));
  Future<void> createLecture(LectureModel model) async {
    state = const AsyncLoading();

    try {
      await ref.read(scheduleServiceProvider).createLecture(model);

      ref.invalidate(lecturesByCourseProvider(model.courseId));

      ref.invalidate(allLecturesProvider);

      state = const AsyncData(null);
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }
}

final localLecturesProvider =
    StateNotifierProvider<LocalLecturesNotifier, List<LectureModel>>((ref) {
      return LocalLecturesNotifier();
    });

class LocalLecturesNotifier extends StateNotifier<List<LectureModel>> {
  LocalLecturesNotifier() : super([]);

  void updateLecture(LectureModel lecture) {
    state = state.map((e) {
      if (e.tempId == lecture.tempId) {
        return lecture;
      }

      return e;
    }).toList();
  }

  void addEmptyLecture(int courseId) {
    if (state.length >= 2) {
      return;
    }

    state = [...state, LectureModel.empty(courseId)];
  }

  void removeLecture(LectureModel lecture) {
    state = state.where((e) => e.tempId != lecture.tempId).toList();
  }

  void clear() {
    state = [];
  }
}
