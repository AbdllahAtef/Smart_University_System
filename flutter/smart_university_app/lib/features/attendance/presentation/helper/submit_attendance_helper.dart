import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/attendance/data/services/attendence_service.dart';
import 'package:smart_university_app/features/attendance/presentation/manager/attendence_provider.dart';
Future<void> submitAttendance(WidgetRef ref, int sessionId) async {
  final attendanceMap = ref.read(attendanceProvider).attendance;

  final service = AttendenceService();

  try {
    ref.read(isSubmittingProvider.notifier).state = true;

    final presentStudents = attendanceMap.entries.where((e) => e.value);

    await Future.wait(
      presentStudents.map((entry) {
        return service.sendAttendance(
          sessionId: sessionId,
          studentId: entry.key,
          isPresent: true,
        );
      }),
    );

    ref.read(attendanceProvider.notifier).clear();
  } catch (e) {
    rethrow;
  } finally {
    ref.read(isSubmittingProvider.notifier).state = false;
  }
}
