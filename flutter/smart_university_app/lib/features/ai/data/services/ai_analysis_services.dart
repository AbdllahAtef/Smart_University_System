import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_university_app/core/network/dio_helper.dart';
import 'package:smart_university_app/features/ai/data/model/ai_analysis_model.dart';

class AiAnalysisService {
  final Dio dio = Dio();
  final apiKey = dotenv.env['Grok_API_KEY'];

  Future<String> getChatResponse(String message) async {
    try {
      if (apiKey == null || apiKey!.isEmpty) {
        return "Error: API Key Not Found";
      }

      const String url = 'https://api.groq.com/openai/v1/chat/completions';

      final data = {
        "model": "llama-3.3-70b-versatile",
        "messages": [
          {"role": "user", "content": message},
        ],
      };

      final response = await dio.post(
        url,
        options: Options(
          headers: {
            "Authorization": "Bearer $apiKey",
            "Content-Type": "application/json",
          },
        ),
        data: data,
      );

      return response.data['choices'][0]['message']['content'].toString();
    } on DioException catch (e) {
      return "Connection Error: ${e.response?.data ?? e.message}";
    } catch (e) {
      return "Unexpected Error: ${e.toString()}";
    }
  }

  Future<AiAnalysisModel?> getAnalysis() async {
    final response = await DioHelper.dio.get('/api/student/ai-analysis');
    if (response.data == null) {
      return null;
    }

    if (response.data is String) {
      return null;
    }

    return AiAnalysisModel.fromJson(response.data);
  }
}
