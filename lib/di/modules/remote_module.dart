import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RemoteModule {
  @singleton
  Dio provideDio() {
    final dio = Dio();
    dio.options.baseUrl = 'https://fake-api.tractian.com/';
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    return dio;
  }
}
