import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_wrapper_model.freezed.dart';
part 'response_wrapper_model.g.dart';

typedef RWM<T> = ResponseWrapperModel<T>;
typedef RWMs<T> = ResponseWrapperModels<T>;
typedef RWMEmpty = ResponseWrapperModel<EmptyDataModel>;

@Freezed(makeCollectionsUnmodifiable: false, genericArgumentFactories: true)
abstract class ResponseWrapperModels<T> with _$ResponseWrapperModels<T> {
  const factory ResponseWrapperModels({
    @JsonKey(name: 'errorMessages') @Default([]) List<String> messages,
    @JsonKey(name: 'data') @Default([]) List<T> data,
  }) = _ResponseWrapperModels<T>;

  factory ResponseWrapperModels.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ResponseWrapperModelsFromJson(json, fromJsonT);
}

@Freezed(makeCollectionsUnmodifiable: false, genericArgumentFactories: true)
abstract class ResponseWrapperModel<T> with _$ResponseWrapperModel<T> {
  const factory ResponseWrapperModel({
    @JsonKey(name: 'errorMessages') @Default([]) List<String> messages,
    @JsonKey(name: 'data') T? data,
  }) = _ResponseWrapperModel<T>;

  factory ResponseWrapperModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ResponseWrapperModelFromJson(json, fromJsonT);
}

@immutable
@Freezed(makeCollectionsUnmodifiable: false)
abstract class EmptyDataModel with _$EmptyDataModel {
  const factory EmptyDataModel() = _EmptyDataModel;

  factory EmptyDataModel.fromJson(Map<String, dynamic> json) =>
      _$EmptyDataModelFromJson(json);
}
