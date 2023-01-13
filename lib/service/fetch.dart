// ignore_for_file: prefer_interpolation_to_compose_strings
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Dio fetch() {
  var dio = Dio();
  dio.interceptors.add(QueuedInterceptorsWrapper(
    onRequest: (options, handler) {
      // print('send request：path:${options.path}，baseURL:${options.baseUrl}');\
      String apiKey = dotenv.env['API_KEY']!;
      options.headers['Authorization'] = "Bearer $apiKey";
      return handler.next(options);
    },
    onError: (err, handler) {
      return handler.reject(err);
    },
    onResponse: (response, handler) {
      return handler.next(response);
    },
  ));

  return dio;
}
