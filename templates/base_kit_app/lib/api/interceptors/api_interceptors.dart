import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../services/storage/token/token_service.dart';
import '../constants/api_constants.dart';
import '../request_tracker/request_tracker.dart';

@lazySingleton
class ApiInterceptor extends Interceptor {
  final TokenService _tokenService;
  final RequestTracker _requestTracker;

  ApiInterceptor(
    this._tokenService,
    this._requestTracker,
  );

  bool _isRefreshing = false;
  Completer<void>? _refreshCompleter;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (ApiConstants.baseUrlMyLocation == options.baseUrl) {
      options.headers
        ..clear()
        ..addAll({
          'accept-encoding': 'gzip, deflate, br, zstd',
          'accept': '*/*',
        });
      if (_isLog) _logRequest(options);
      return super.onRequest(options, handler);
    }

    final token = await _tokenService.getToken();
    options.headers
      ..putIfAbsent('accept', () => '*/*')
      ..putIfAbsent('Content-Type', () => 'application/json');
    if (options.path == '/auth/logout') {
      final token = await _tokenService.getRefreshToken();
      options.headers['Authorization'] = 'Bearer $token';
    } else if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    if (_isLog) _logRequest(options);
    _requestTracker.start();
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    _requestTracker.done();
    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401 &&
        !_isRefreshing &&
        await _tokenService.getRefreshToken() != '') {
      try {
        await _refreshToken();
        final newRequest = await Dio().request<dynamic>(
          err.requestOptions.path,
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
          options: Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
            extra: err.requestOptions.extra,
            responseType: err.requestOptions.responseType,
            contentType: err.requestOptions.contentType,
            followRedirects: err.requestOptions.followRedirects,
            receiveTimeout: err.requestOptions.receiveTimeout,
            sendTimeout: err.requestOptions.sendTimeout,
          ),
        );
        _requestTracker.done();
        return handler.resolve(newRequest);
      } catch (e) {
        _requestTracker.done();
        return handler.reject(err);
      }
    }

    _requestTracker.done();
    return super.onError(err, handler);
  }

  Future<void> _refreshToken() async {
    if (_isRefreshing) return _refreshCompleter!.future;

    _isRefreshing = true;
    _refreshCompleter = Completer<void>();

    try {
      final refresh = await _tokenService.getRefreshToken();
      final response = await Dio().post<Map<String, dynamic>>(
        ApiConstants.refreshEndpoint,
        data: {'refreshToken': refresh},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      final data = response.data!;
      final newToken = data['token'] as String;
      final newRefresh = data['refreshToken'] as String? ?? refresh;

      await _tokenService.saveToken(newToken);
      await _tokenService.saveRefreshToken(newRefresh);

      _refreshCompleter!.complete();
    } catch (e, s) {
      _refreshCompleter!.completeError(e, s);
      rethrow;
    } finally {
      _isRefreshing = false;
    }

    return _refreshCompleter!.future;
  }

  void _logRequest(RequestOptions options) {
    final data = options.data;
    final query = options.queryParameters;
    final headers = options.headers;

    if (data is FormData) {
      for (final field in data.fields) {
        log('Field: ${field.key}: ${field.value}');
      }
      for (final file in data.files) {
        log('File: ${file.key}: ${file.value.filename}');
      }
    } else if (data != null && data.toString().length > 2) {
      log(jsonEncode(data));
    }

    if (query.isNotEmpty && query.toString().length > 2) {
      log(jsonEncode(query));
    }
    log(jsonEncode(headers));
  }
}

bool get _isLog => true;
