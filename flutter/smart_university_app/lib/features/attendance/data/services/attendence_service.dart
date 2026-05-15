import 'package:smart_university_app/core/network/dio_helper.dart';

class AttendenceService {
  Future<int> createSession(int courseId) async {
    try {
      final response = await DioHelper.dio.post(
        '/api/attendance/session',
        queryParameters: {'courseId': courseId},
      );
      return response.data['sessionId'];
    } catch (e) {
      throw Exception("$e");
    }
  }

  Future<void> sendAttendance({
    required int sessionId,
    required int studentId,
    required bool isPresent,
  }) async {
    try {
      await DioHelper.dio.post(
        '/api/attendance/record',
        queryParameters: {'sessionId': sessionId},
        data: [
          {"studentId": studentId, "isPresent": isPresent},
        ],
      );
    } catch (e) {
      throw Exception("$e");
    }
  }
}
