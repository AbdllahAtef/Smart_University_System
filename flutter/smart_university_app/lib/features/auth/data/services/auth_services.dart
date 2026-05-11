import 'package:dio/dio.dart';
import 'package:smart_university_app/core/network/dio_helper.dart';
import 'package:smart_university_app/features/auth/data/models/login_model.dart';
import 'package:smart_university_app/features/auth/data/models/login_responce_model.dart';
import 'package:smart_university_app/features/auth/data/models/register_model.dart';

class AuthService {
  Future<Map<String, dynamic>> register({
    required RegisterRequest request,
  }) async {
    try {
      final response = await DioHelper.dio.post(
        '/api/Auth/register',
        data: request.toJson(),
      );

      final data = response.data;

      if (data == null) {
        return {};
      }

      if (data is Map<String, dynamic>) {
        return data;
      }

      return {};
    } catch (e) {
      if (e is DioException && e.response?.data != null) {
        return e.response!.data;
      }

      rethrow;
    }
  }

  Future<LoginResponseModel> login({required LoginRequest request}) async {
    try {
      final response = await DioHelper.dio.post(
        '/api/Auth/login',
        data: request.toJson(),
      );

      return LoginResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      final data = e.response?.data;

      throw Exception(data['message'] ?? data['error'] ?? "Login failed");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<dynamic>> getFaculties() async {
    try {
      final response = await DioHelper.dio.get('/api/Faculties');

      final rawData = response.data;

      if (rawData == null) {
        return [];
      }

      final data = rawData is List ? rawData : rawData['data'];

      if (data == null || data is! List || data.isEmpty) {
        return [];
      }

      return data;
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        return [];
      }

      rethrow;
    }
  }
}
