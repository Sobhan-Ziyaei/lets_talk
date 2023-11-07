import 'package:dio/dio.dart';

class DioProvider {
  static Dio createDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'http://103.75.199.143:7000/api/v1/',
      ),
    );
    return dio;
  }
}
