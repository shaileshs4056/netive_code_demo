import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../data/remote/auth_api.dart';
import '../locator/locator.dart';
import 'api_end_points.dart';
import 'interceptor/custom_interceptors.dart';
import 'interceptor/internet_interceptor.dart';

class ApiModule {
  Future<void> provides() async {
    final dio = await setup();

    /// register [Dio] to [GetIt]
    locator.registerSingleton(dio);

    /// register APIs implementations
    locator.registerSingleton(AuthApi(dio));
  }

  static FutureOr<Dio> setup() async {
    final Dio dio = Dio()
      ..options = BaseOptions(
        baseUrl: APIEndPoints.baseUrl,
        validateStatus: (status) {
          if (status == null) return true;
          if (status == 401 || status >= 500) return false;
          return true;
        },
        responseType: ResponseType.plain,
        headers: {
          'content-type': 'text/plain',
          'contentType': 'text/plain',
          'responseType': 'text/plain',
        },
      );

    /// Disable logging into production
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          responseBody: false,
        ),
      );
    }
    dio.interceptors.add(CustomInterceptors());

    /// Disable logging into production
    if (!kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          request: false,
          responseHeader: true,
        ),
      );
    }
    dio.interceptors.add(InternetInterceptors());

    return dio;
  }
}
