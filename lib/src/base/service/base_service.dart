import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../utils/logger.dart';
import '../exceptions/application_exception.dart';
import '../exceptions/api_exception.dart';

@immutable
abstract class BaseService {
  const BaseService();

  Future<T> errorParser<T>(
    AsyncValueGetter<T> callback, {
    ValueChanged<ApplicationException>? failureCall,
  }) async {
    try {
      return await callback();
    } on DioException catch (exception) {
      throw await _getProcessedDioError(exception);
    } catch (exception, stackTrace) {
      final error = exception.toString();
      loggerApp.e(error, error: exception, stackTrace: stackTrace);
      final appException = exception is String
          ? ApplicationException(exception)
          : ApplicationException(error);

      failureCall?.call(appException);

      throw appException;
    } finally {}
  }

  Future<T?> errorAbsorbParser<T>(AsyncValueGetter<T?> callback) async {
    try {
      try {
        return await callback();
      } catch (error, stackTrace) {
        loggerApp.e(
          'Error Absorbed Parsed Call',
          error: error,
          stackTrace: stackTrace,
        );
      }
    } catch (_) {}

    return null;
  }

  Future<ApiException> _getProcessedDioError(DioException exception) async {
    try {
      await InternetAddress.lookup('example.com');
    } on SocketException catch (_) {
      return ApiException(
        message: 'Internet Connection Error',
        errors: 'Internet Connection Error',
      );
    }

    final unknownApiException = ApiException(
      message: 'Server error occurred',
      errors: 'Server error occurred',
    );

    try {
      final data = exception.response?.data;
      if (data is Map<String, dynamic>) {
        return ApiException(
          statusCode: exception.response?.statusCode,
          message: _parsMessage(data),
          errors: '${data['data']}',
        );
      }
    } catch (_) {}

    try {
      final error = exception.error;
      if (error is JsonUnsupportedObjectError) {
        return ApiException(
          statusCode: exception.response?.statusCode,
          message: error.partialResult.toString(),
          errors: '${error.unsupportedObject}',
        );
      }
    } catch (_) {}

    try {
      final response = exception.response;

      if (response == null) {
        return unknownApiException;
      }

      final apiError = response;

      return ApiException.fromJson(
        apiError.data,
      ).copyWith(statusCode: apiError.statusCode);
    } catch (_) {
      return unknownApiException;
    }
  }

  String _parsMessage(Map<String, dynamic> map) {
    final message = map['message'];
    if (message is List) return message.join('\n');
    final messages = map['messages'];
    if (messages is List) return messages.join('\n');
    final subErrors = map['subErrors'];
    if (subErrors is List) return subErrors.join('\n');

    return '$map';
  }
}
