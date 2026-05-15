import 'package:dio/dio.dart';
import 'package:smart_university_app/features/course/data/model/courses_model.dart';
import 'package:smart_university_app/features/schedule/data/model/lecture_model.dart';
import 'package:smart_university_app/core/network/dio_helper.dart';

class ScheduleService {
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

  Future<List<LectureModel>> getLectures(int courseId) async {
    try {
      final response = await DioHelper.dio.get('/api/lectures/$courseId');

      final rawData = response.data;

      if (rawData == null) {
        return [];
      }

      final data = rawData is List ? rawData : rawData['data'];

      if (data == null || data is! List || data.isEmpty) {
        return [];
      }

      return data.map<LectureModel>((e) => LectureModel.fromJson(e)).toList();
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        return [];
      }
      rethrow;
    }
  }

  Future<List<LectureModel>> getAllLecturesForStudent(int studentId) async {
    final courses = await getMyCourses(studentId);

    if (courses.isEmpty) {
      return [];
    }

    final futures = courses.map((course) {
      return getLectures(course.id);
    });

    final results = await Future.wait(futures);

    return results.expand((e) => e).toList();
  }

  Future<List<LectureModel>> getDoctorLectures() async {
    try {
      final response = await DioHelper.dio.get('/api/lectures/doctor');

      final rawData = response.data;

      if (rawData == null) {
        return [];
      }

      final data = rawData is List ? rawData : rawData['data'];

      if (data == null || data is! List || data.isEmpty) {
        return [];
      }

      return data.map<LectureModel>((e) => LectureModel.fromJson(e)).toList();
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        return [];
      }

      rethrow;
    }
  }

  Future<void> createLecture(LectureModel model) async {
    await DioHelper.dio.post('/api/lectures', data: model.toJson());
  }

  Future<void> updateLecture({
    required int id,
    required LectureModel model,
  }) async {
    final data = {
      "title": model.title,

      "subtitle": model.subtitle,

      "room": model.room,

      "instructor": model.instructor,

      "day": model.day,

      "startTime": model.startTime,

      "endTime": model.endTime,
    };


    try {
      await DioHelper.dio.put('/api/lectures/$id', data: data);
    } on DioException {
      

      rethrow;
    }
  }

  Future<void> deleteLecture(int id) async {
    await DioHelper.dio.delete('/api/lectures/$id');
  }
}
