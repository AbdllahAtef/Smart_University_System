import 'package:smart_university_app/features/attendance/data/model/attendence_model.dart';

class AttendanceSessionsState {
  final bool isLoading;

  final String? error;

  final List<AttendanceSessionModel> sessions;

  const AttendanceSessionsState({
    this.isLoading = false,
    this.error,
    this.sessions = const [],
  });

  AttendanceSessionsState copyWith({
    bool? isLoading,
    String? error,
    List<AttendanceSessionModel>? sessions,
  }) {
    return AttendanceSessionsState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      sessions: sessions ?? this.sessions,
    );
  }
}
