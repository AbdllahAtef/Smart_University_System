import 'package:dio/dio.dart';


String getErrorMessage(Object e) {
  String message = "Something went wrong";

  if (e is DioException) {
    final data = e.response?.data;

    if (data is Map<String, dynamic>) {
      message = data['error'] ?? data['message'] ?? "Error occurred";
    } else if (data is String) {
      message = data;
    }
  } else {
    message = e.toString();
  }

  return message;
}
