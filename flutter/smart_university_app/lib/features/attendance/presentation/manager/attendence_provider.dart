import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:smart_university_app/features/attendance/data/model/attendence_model.dart';
import 'package:smart_university_app/features/attendance/data/services/attendence_service.dart';
import 'package:smart_university_app/features/attendance/presentation/manager/state/attendance_session_state.dart';

final attendenceServiceProvider = Provider((ref) {
  return AttendenceService();
});

final attendanceProvider =
    StateNotifierProvider<AttendanceNotifier, AttendanceState>((ref) {
      return AttendanceNotifier();
    });

final isSubmittingProvider = StateProvider<bool>((ref) => false);

class AttendanceNotifier extends StateNotifier<AttendanceState> {
  AttendanceNotifier() : super(AttendanceState());

  void toggle(int studentId, bool value) {
    state = state.copyWith(attendance: {...state.attendance, studentId: value});
  }

  void toggleAll(List<int> studentIds, bool value) {
    final updated = {for (var id in studentIds) id: value};

    state = state.copyWith(attendance: updated);
  }

  bool isPresent(int studentId) {
    return state.attendance[studentId] ?? false;
  }

  void clear() {
    state = state.copyWith(attendance: {});
  }
}

final attendanceSessionsProvider =
    StateNotifierProvider<AttendanceSessionsNotifier, AttendanceSessionsState>((
      ref,
    ) {
      return AttendanceSessionsNotifier(ref);
    });

class AttendanceSessionsNotifier
    extends StateNotifier<AttendanceSessionsState> {
  final Ref ref;

  AttendanceSessionsNotifier(this.ref) : super(const AttendanceSessionsState());

  Future<int?> addSession(int courseId) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final service = ref.read(attendenceServiceProvider);

      final sessionId = await service.createSession(courseId);

      final newSession = AttendanceSessionModel(
        sessionId: sessionId,
        date: DateTime.now(),
        courseId: courseId,
      );

      state = state.copyWith(
        isLoading: false,
        sessions: [...state.sessions, newSession],
      );

      return sessionId;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());

      return null;
    }
  }
}
