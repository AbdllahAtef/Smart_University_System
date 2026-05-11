class AttendanceRequest {
  final int studentId;
  final bool isPresent;

  AttendanceRequest({required this.studentId, required this.isPresent});

  Map<String, dynamic> toJson() {
    return {"studentId": studentId, "isPresent": isPresent};
  }
}
class AttendanceState {
  final Map<int, bool> attendance;

  AttendanceState({this.attendance = const {}});

  AttendanceState copyWith({Map<int, bool>? attendance}) {
    return AttendanceState(attendance: attendance ?? this.attendance);
  }
}
class AttendanceSessionModel {
  final int sessionId;

  final int courseId;

  final DateTime date;

  AttendanceSessionModel({
    required this.sessionId,
    required this.courseId,
    required this.date,
  });
}
