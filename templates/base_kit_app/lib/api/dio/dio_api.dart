import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/api_constants.dart';
import '../interceptors/api_interceptors.dart';

@module
@immutable
abstract class DioModule {
  @lazySingleton
  Dio client(ApiInterceptor interceptor) {
    return Dio()
      ..options.baseUrl = ApiConstants.baseUrl
      ..options.contentType = Headers.jsonContentType
      ..options.sendTimeout = const Duration(seconds: 10)
      ..options.connectTimeout = const Duration(seconds: 10)
      ..options.receiveTimeout = const Duration(seconds: 10)
      ..interceptors.addAll([
        PrettyDioLogger(
          requestHeader: false,
          requestBody: false,
          responseBody: false,
        ),
        interceptor,
      ]);
  }
}
