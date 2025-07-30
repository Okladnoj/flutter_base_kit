// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiException _$ApiExceptionFromJson(Map<String, dynamic> json) => ApiException(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      title: json['title'] as String? ?? '',
      message: json['message'] as String? ?? '',
      errors: json['errors'] == null
          ? ''
          : const ApiErrorsConverter().fromJson(json['errors']),
    );

Map<String, dynamic> _$ApiExceptionToJson(ApiException instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'title': instance.title,
      'errors': const ApiErrorsConverter().toJson(instance.errors),
    };
