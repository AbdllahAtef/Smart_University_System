import 'package:dio/dio.dart';
import 'package:smart_university_app/core/network/dio_helper.dart';
import 'package:smart_university_app/features/results/data/model/add_grades_model.dart';
import 'package:smart_university_app/features/results/data/model/grades_model.dart';
import 'package:smart_university_app/features/results/data/model/grading_schema_model.dart';

class GradesService {
  Future<GradeResponseModel?> getGradeByCourseId(int courseId) async {
    try {
      final response = await DioHelper.dio.get('/api/grades/$courseId');
      final data = response.data;

      if (data == null) return null;

      if (data is Map<String, dynamic>) {
        return GradeResponseModel.fromJson(data);
      }

      return null;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404 || e.response?.statusCode == 400) {
        return null;
      }

      rethrow;
    }
  }

  Future<void> submitGrade(SubmitGradeModel model) async {
    await DioHelper.dio.post(model.endpoint, data: model.toJson());
  }

  Future<void> updateGradingScheme({
    required int courseId,
    required GradingSchemeModel model,
  }) async {
    await DioHelper.dio.post(
      "/api/Courses/$courseId/grading",
      data: model.toJson(),
    );
  }
}
