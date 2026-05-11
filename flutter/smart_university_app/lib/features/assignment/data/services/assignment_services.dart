import 'package:dio/dio.dart';
import 'package:smart_university_app/core/network/dio_helper.dart';
import 'package:smart_university_app/features/assignment/data/model/assignments_model.dart';
import 'package:smart_university_app/features/assignment/data/model/create_assignment_model.dart';

class AssignmentService {
  Future<List<AssignmentModel>> getAssignments(int courseId) async {
    try {
      final response = await DioHelper.dio.get(
        '/api/Assignments/course/$courseId',
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
          .map<AssignmentModel>((e) => AssignmentModel.fromJson(e))
          .toList();
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        return [];
      }

      rethrow;
    }
  }

  Future<void> createAssignment(CreateAssignmentModel model) async {
    await DioHelper.dio.post('/api/Assignments', data: model.toJson());
  }
}
