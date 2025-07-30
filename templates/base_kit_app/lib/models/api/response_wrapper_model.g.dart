// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_wrapper_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseWrapperModelsImpl<T> _$$ResponseWrapperModelsImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ResponseWrapperModelsImpl<T>(
      messages: (json['errorMessages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      data:
          (json['data'] as List<dynamic>?)?.map(fromJsonT).toList() ?? const [],
    );

Map<String, dynamic> _$$ResponseWrapperModelsImplToJson<T>(
  _$ResponseWrapperModelsImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'errorMessages': instance.messages,
      'data': instance.data.map(toJsonT).toList(),
    };

_$ResponseWrapperModelImpl<T> _$$ResponseWrapperModelImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ResponseWrapperModelImpl<T>(
      messages: (json['errorMessages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$$ResponseWrapperModelImplToJson<T>(
  _$ResponseWrapperModelImpl<T> instance,
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

_$EmptyDataModelImpl _$$EmptyDataModelImplFromJson(Map<String, dynamic> json) =>
    _$EmptyDataModelImpl();

Map<String, dynamic> _$$EmptyDataModelImplToJson(
        _$EmptyDataModelImpl instance) =>
    <String, dynamic>{};
