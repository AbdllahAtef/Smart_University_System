import 'package:dio/dio.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';
import 'package:smart_university_app/core/network/dio_helper.dart';

class EnrollmentService {
  Future<List<CourseModel>> getMyCourses(int studentId) async {
    try {
      final response = await DioHelper.dio.get(
        '/api/Enrollment/my-courses/$studentId',
      );

      final rawData = response.data;

      if (rawData == null) {
        return [];
      }

      final data = rawData is List ? rawData : rawData['data'];

      if (data == null || data is! List || data.isEmpty) {
        return [];
      }

      return data.map<CourseModel>((e) => CourseModel.fromJson(e)).toList();
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        return [];
      }
      rethrow;
    }
  }
}


