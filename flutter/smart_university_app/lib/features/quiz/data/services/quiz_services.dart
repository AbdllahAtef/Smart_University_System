import 'package:dio/dio.dart';
import 'package:smart_university_app/core/network/dio_helper.dart';
import 'package:smart_university_app/features/quiz/data/model/create_question_model.dart';
import 'package:smart_university_app/features/quiz/data/model/create_quiz_model.dart';
import 'package:smart_university_app/features/quiz/data/model/question_model.dart';
import 'package:smart_university_app/features/quiz/data/model/quiz_result_model.dart';
import 'package:smart_university_app/features/quiz/data/model/quiz_status_model.dart';
import 'package:smart_university_app/features/quiz/data/model/quizes_model.dart';

class QuizService {
  Future<List<QuizModel>> getQuizzes(int courseId) async {
    try {
      final response = await DioHelper.dio.get(
        '/api/courses/$courseId/quizzes',
      );

      final rawData = response.data;

      if (rawData == null) {
        return [];
      }

      final data = rawData is List
          ? rawData
          : rawData is Map
          ? rawData['data']
          : null;

      if (data == null || data is! List || data.isEmpty) {
        return [];
      }

      return data.map<QuizModel>((e) => QuizModel.fromJson(e)).toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return [];
      }

      throw Exception(e.response?.data['message'] ?? 'Failed to load quizzes');
    }
  }

  Future<List<QuestionModel>> getQuestionsWithAnswers(int quizId) async {
    try {
      final response = await DioHelper.dio.get(
        "/api/quizzes/$quizId/questionsWithAnswers",
      );

      final data = response.data;

      if (data == null || data is! List) {
        return [];
      }

      return data.map<QuestionModel>((e) => QuestionModel.fromJson(e)).toList();
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ?? 'Failed to load questions',
      );
    }
  }

  Future<QuizStatusModel?> getQuizStatus(int quizId) async {
    try {
      final response = await DioHelper.dio.get(
        '/api/QuizSubmissions/status/$quizId',
      );

      final data = response.data;

      if (data == null || data is! Map<String, dynamic>) {
        return null;
      }

      return QuizStatusModel.fromJson(data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }

      throw Exception(
        e.response?.data['message'] ?? 'Failed to load quiz status',
      );
    }
  }

  Future<void> startQuiz(int quizId) async {
    try {
      await DioHelper.dio.post('/api/quizzes/$quizId/start');
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Failed to start quiz');
    }
  }

  Future<List<QuestionModel>> getQuestions(int quizId) async {
    try {
      final response = await DioHelper.dio.get('/api/Questions/quiz/$quizId');

      final rawData = response.data;

      if (rawData == null) {
        return [];
      }

      final data = rawData is List
          ? rawData
          : rawData is Map
          ? rawData['data']
          : null;

      if (data == null || data is! List || data.isEmpty) {
        return [];
      }

      return data.map<QuestionModel>((e) => QuestionModel.fromJson(e)).toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return [];
      }

      throw Exception(
        e.response?.data['message'] ?? 'Failed to load questions',
      );
    }
  }

  Future<void> submitQuiz(int quizId, Map<int, int> answers) async {
    try {
      if (answers.isEmpty) {
        throw Exception("Cannot submit quiz with no answers selected");
      }

      final body = {
        "quizId": quizId,
        "answers": answers.entries
            .map((e) => {"questionId": e.key, "selectedOptionId": e.value})
            .toList(),
      };

      await DioHelper.dio.post("/api/QuizSubmissions", data: body);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Failed to submit quiz');
    }
  }

  Future<QuizResultModel?> getQuizResult(int quizId) async {
    try {
      final response = await DioHelper.dio.get(
        '/api/QuizSubmissions/result/$quizId',
      );

      final data = response.data;

      if (data == null || data is! Map<String, dynamic>) {
        return null;
      }

      return QuizResultModel.fromJson(data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }

      throw Exception(e.response?.data['message'] ?? 'Failed to load result');
    }
  }

  Future<int> createQuiz(CreateQuizModel request) async {
    try {
      final response = await DioHelper.dio.post(
        '/api/quizzes',
        data: request.toJson(),
      );

      return response.data['id'];
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Failed to create quiz');
    }
  }

  Future<void> createQuestion(CreateQuestionModel request) async {
    try {
      await DioHelper.dio.post('/api/questions', data: request.toJson());
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ?? 'Failed to create question',
      );
    }
  }
}
