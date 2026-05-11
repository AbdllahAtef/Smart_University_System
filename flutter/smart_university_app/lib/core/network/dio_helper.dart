import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioHelper {
  static late Dio dio;
  static String? _token;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://10.0.2.2:7146',
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (_token != null && _token!.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $_token";
          }


          return handler.next(options);
        },
      ),
    );

    dio.httpClientAdapter = DefaultHttpClientAdapter()
      ..onHttpClientCreate = (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
  }

  static void setToken(String token) {
    _token = token;
  }
}