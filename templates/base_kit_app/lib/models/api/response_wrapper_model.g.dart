// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_wrapper_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResponseWrapperModels<T> _$ResponseWrapperModelsFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _ResponseWrapperModels<T>(
      messages: (json['errorMessages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      data:
          (json['data'] as List<dynamic>?)?.map(fromJsonT).toList() ?? const [],
    );

Map<String, dynamic> _$ResponseWrapperModelsToJson<T>(
  _ResponseWrapperModels<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'errorMessages': instance.messages,
      'data': instance.data.map(toJsonT).toList(),
    };

_ResponseWrapperModel<T> _$ResponseWrapperModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _ResponseWrapperModel<T>(
      messages: (json['errorMessages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$ResponseWrapperModelToJson<T>(
  _ResponseWrapperModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'errorMessages': instance.messages,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

_EmptyDataModel _$EmptyDataModelFromJson(Map<String, dynamic> json) =>
    _EmptyDataModel();

Map<String, dynamic> _$EmptyDataModelToJson(_EmptyDataModel instance) =>
    <String, dynamic>{};
