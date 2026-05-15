import 'package:dio/dio.dart';
import 'package:smart_university_app/core/network/dio_helper.dart';
import 'package:smart_university_app/features/news_events/data/model/news_model.dart';

class NewsService {
  Future<List<NewsModel>> getNews() async {
    try {
      final response = await DioHelper.dio.get('/api/news');

      final rawData = response.data;

      if (rawData == null) {
        return [];
      }

      final data = rawData is List ? rawData : rawData['data'];

      if (data == null || data is! List || data.isEmpty) {
        return [];
      }

      return data.map<NewsModel>((e) => NewsModel.fromJson(e)).toList();
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        return [];
      }
      rethrow;
    }
  }
}


