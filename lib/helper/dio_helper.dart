import 'package:dio/dio.dart';

import 'api_url.dart';

class DioHelper {
  static Dio? dio;
  static String token = "";
  static Map<String, dynamic> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
    if (token.isNotEmpty) "Authorization": token,
  };

  init() {
    dio = Dio(BaseOptions(
      baseUrl: ApiUrl.baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      responseType: ResponseType.json,
      receiveDataWhenStatusError: true,
      headers: headers,
    ));
  }

  ///Get Data
  Future<Response> getData({
    required String path,
    Map<String, dynamic>? body,
  }) async {
    final response = await dio!.get(path, data: body);

    return response;
  }
}
