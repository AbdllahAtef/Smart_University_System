import 'package:dio/dio.dart';
import 'package:smart_university_app/core/network/dio_helper.dart';
import 'package:smart_university_app/features/course/data/model/course_students_model.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';

class CourseService {
  Future<List<CourseModel>> getCourses({String? name}) async {
    try {
      final response = await DioHelper.dio.get(
        '/api/Courses',
        queryParameters: {"name": name, "page": 1, "pageSize": 10},
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

  Future<List<CourseModel>> getDoctorCourses() async {
    final response = await DioHelper.dio.get('/api/Courses/doctor');

    final data = response.data;

    if (data == null || data is! List) {
      return [];
    }

    return data.map<CourseModel>((e) => CourseModel.fromJson(e)).toList();
  }

  Future<List<CourseStudentsModel>> getCourseStudents(int courseId) async {
    final response = await DioHelper.dio.get('/api/courses/$courseId/students');

    final data = response.data;

    if (data == null || data is! List) return [];

    return data.map((e) => CourseStudentsModel.fromJson(e)).toList();
  }
}


