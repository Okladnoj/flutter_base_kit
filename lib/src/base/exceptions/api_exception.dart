// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/json_converter/api_errors_converter.dart';
import 'base_exception.dart';

part 'api_exception.g.dart';

@JsonSerializable()
class ApiException extends BaseException {
  final int? statusCode;
  final String title;
  @JsonKey(includeFromJson: false)
  final String traceId;
  @ApiErrorsConverter()
  final String errors;

  ApiException({
    this.statusCode,
    this.title = '',
    super.message = '',
    this.traceId = '',
    this.errors = '',
  });

  factory ApiException.fromJson(Map<String, dynamic> json) {
    return _$ApiExceptionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApiExceptionToJson(this);

  @override
  String toString() {
    return '$title\n$message';
  }

  ApiException copyWith({
    int? statusCode,
    String? title,
    String? message,
    String? traceId,
    String? errors,
  }) {
    return ApiException(
      statusCode: statusCode ?? this.statusCode,
      title: title ?? this.title,
      message: message ?? this.message,
      traceId: traceId ?? this.traceId,
      errors: errors ?? this.errors,
    );
  }
}
