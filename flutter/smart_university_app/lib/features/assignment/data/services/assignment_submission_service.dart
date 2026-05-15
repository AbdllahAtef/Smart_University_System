import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:smart_university_app/core/network/dio_helper.dart';
import 'package:smart_university_app/features/assignment/data/model/assignment_submission_model.dart';

class AssignmentSubmissionService {
  Future<void> submitAssignment({
    required int assignmentId,
    required PlatformFile file,
  }) async {
    final formData = FormData.fromMap({
      "assignmentId": assignmentId,
      "file": await MultipartFile.fromFile(file.path!, filename: file.name),
    });

    await DioHelper.dio.post('/api/AssignmentSubmissions', data: formData);
  }

  Future<List<AssignmentSubmissionModel>> getSubmissions(
    int assignmentId,
  ) async {
    try {
      final response = await DioHelper.dio.get(
        '/api/AssignmentSubmissions/assignment/$assignmentId',
      );

      final rawData = response.data;

      if (rawData == null) {
        return [];
      }

      final data = rawData is List ? rawData : rawData['data'];

      if (data == null || data is! List || data.isEmpty) {
        return [];
      }

      return data
          .map<AssignmentSubmissionModel>(
            (e) => AssignmentSubmissionModel.fromJson(e),
          )
          .toList();
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        return [];
      }

      rethrow;
    }
  }

  Future<void> deleteSubmission(int id) async {
    await DioHelper.dio.delete('/api/AssignmentSubmissions/$id');
  }
}
