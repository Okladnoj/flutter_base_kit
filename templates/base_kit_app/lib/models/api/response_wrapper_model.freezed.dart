// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_wrapper_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResponseWrapperModels<T> _$ResponseWrapperModelsFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ResponseWrapperModels<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ResponseWrapperModels<T> {
  @JsonKey(name: 'errorMessages')
  List<String> get messages => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<T> get data => throw _privateConstructorUsedError;

  /// Serializes this ResponseWrapperModels to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ResponseWrapperModels
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseWrapperModelsCopyWith<T, ResponseWrapperModels<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseWrapperModelsCopyWith<T, $Res> {
  factory $ResponseWrapperModelsCopyWith(ResponseWrapperModels<T> value,
          $Res Function(ResponseWrapperModels<T>) then) =
      _$ResponseWrapperModelsCopyWithImpl<T, $Res, ResponseWrapperModels<T>>;
  @useResult
  $Res call(
      {@JsonKey(name: 'errorMessages') List<String> messages,
      @JsonKey(name: 'data') List<T> data});
}

/// @nodoc
class _$ResponseWrapperModelsCopyWithImpl<T, $Res,
        $Val extends ResponseWrapperModels<T>>
    implements $ResponseWrapperModelsCopyWith<T, $Res> {
  _$ResponseWrapperModelsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseWrapperModels
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseWrapperModelsImplCopyWith<T, $Res>
    implements $ResponseWrapperModelsCopyWith<T, $Res> {
  factory _$$ResponseWrapperModelsImplCopyWith(
          _$ResponseWrapperModelsImpl<T> value,
          $Res Function(_$ResponseWrapperModelsImpl<T>) then) =
      __$$ResponseWrapperModelsImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'errorMessages') List<String> messages,
      @JsonKey(name: 'data') List<T> data});
}

/// @nodoc
class __$$ResponseWrapperModelsImplCopyWithImpl<T, $Res>
    extends _$ResponseWrapperModelsCopyWithImpl<T, $Res,
        _$ResponseWrapperModelsImpl<T>>
    implements _$$ResponseWrapperModelsImplCopyWith<T, $Res> {
  __$$ResponseWrapperModelsImplCopyWithImpl(
      _$ResponseWrapperModelsImpl<T> _value,
      $Res Function(_$ResponseWrapperModelsImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ResponseWrapperModels
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? data = null,
  }) {
    return _then(_$ResponseWrapperModelsImpl<T>(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ResponseWrapperModelsImpl<T>
    with DiagnosticableTreeMixin
    implements _ResponseWrapperModels<T> {
  const _$ResponseWrapperModelsImpl(
      {@JsonKey(name: 'errorMessages') this.messages = const [],
      @JsonKey(name: 'data') this.data = const []});

  factory _$ResponseWrapperModelsImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ResponseWrapperModelsImplFromJson(json, fromJsonT);

  @override
  @JsonKey(name: 'errorMessages')
  final List<String> messages;
  @override
  @JsonKey(name: 'data')
  final List<T> data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponseWrapperModels<$T>(messages: $messages, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResponseWrapperModels<$T>'))
      ..add(DiagnosticsProperty('messages', messages))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseWrapperModelsImpl<T> &&
            const DeepCollectionEquality().equals(other.messages, messages) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(messages),
      const DeepCollectionEquality().hash(data));

  /// Create a copy of ResponseWrapperModels
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseWrapperModelsImplCopyWith<T, _$ResponseWrapperModelsImpl<T>>
      get copyWith => __$$ResponseWrapperModelsImplCopyWithImpl<T,
          _$ResponseWrapperModelsImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ResponseWrapperModelsImplToJson<T>(this, toJsonT);
  }
}

abstract class _ResponseWrapperModels<T> implements ResponseWrapperModels<T> {
  const factory _ResponseWrapperModels(
          {@JsonKey(name: 'errorMessages') final List<String> messages,
          @JsonKey(name: 'data') final List<T> data}) =
      _$ResponseWrapperModelsImpl<T>;

  factory _ResponseWrapperModels.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ResponseWrapperModelsImpl<T>.fromJson;

  @override
  @JsonKey(name: 'errorMessages')
  List<String> get messages;
  @override
  @JsonKey(name: 'data')
  List<T> get data;

  /// Create a copy of ResponseWrapperModels
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseWrapperModelsImplCopyWith<T, _$ResponseWrapperModelsImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseWrapperModel<T> _$ResponseWrapperModelFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ResponseWrapperModel<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ResponseWrapperModel<T> {
  @JsonKey(name: 'errorMessages')
  List<String> get messages => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  T? get data => throw _privateConstructorUsedError;

  /// Serializes this ResponseWrapperModel to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ResponseWrapperModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResponseWrapperModelCopyWith<T, ResponseWrapperModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseWrapperModelCopyWith<T, $Res> {
  factory $ResponseWrapperModelCopyWith(ResponseWrapperModel<T> value,
          $Res Function(ResponseWrapperModel<T>) then) =
      _$ResponseWrapperModelCopyWithImpl<T, $Res, ResponseWrapperModel<T>>;
  @useResult
  $Res call(
      {@JsonKey(name: 'errorMessages') List<String> messages,
      @JsonKey(name: 'data') T? data});
}

/// @nodoc
class _$ResponseWrapperModelCopyWithImpl<T, $Res,
        $Val extends ResponseWrapperModel<T>>
    implements $ResponseWrapperModelCopyWith<T, $Res> {
  _$ResponseWrapperModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResponseWrapperModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseWrapperModelImplCopyWith<T, $Res>
    implements $ResponseWrapperModelCopyWith<T, $Res> {
  factory _$$ResponseWrapperModelImplCopyWith(
          _$ResponseWrapperModelImpl<T> value,
          $Res Function(_$ResponseWrapperModelImpl<T>) then) =
      __$$ResponseWrapperModelImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'errorMessages') List<String> messages,
      @JsonKey(name: 'data') T? data});
}

/// @nodoc
class __$$ResponseWrapperModelImplCopyWithImpl<T, $Res>
    extends _$ResponseWrapperModelCopyWithImpl<T, $Res,
        _$ResponseWrapperModelImpl<T>>
    implements _$$ResponseWrapperModelImplCopyWith<T, $Res> {
  __$$ResponseWrapperModelImplCopyWithImpl(_$ResponseWrapperModelImpl<T> _value,
      $Res Function(_$ResponseWrapperModelImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ResponseWrapperModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? data = freezed,
  }) {
    return _then(_$ResponseWrapperModelImpl<T>(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ResponseWrapperModelImpl<T>
    with DiagnosticableTreeMixin
    implements _ResponseWrapperModel<T> {
  const _$ResponseWrapperModelImpl(
      {@JsonKey(name: 'errorMessages') this.messages = const [],
      @JsonKey(name: 'data') this.data});

  factory _$ResponseWrapperModelImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ResponseWrapperModelImplFromJson(json, fromJsonT);

  @override
  @JsonKey(name: 'errorMessages')
  final List<String> messages;
  @override
  @JsonKey(name: 'data')
  final T? data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponseWrapperModel<$T>(messages: $messages, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResponseWrapperModel<$T>'))
      ..add(DiagnosticsProperty('messages', messages))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseWrapperModelImpl<T> &&
            const DeepCollectionEquality().equals(other.messages, messages) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(messages),
      const DeepCollectionEquality().hash(data));

  /// Create a copy of ResponseWrapperModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseWrapperModelImplCopyWith<T, _$ResponseWrapperModelImpl<T>>
      get copyWith => __$$ResponseWrapperModelImplCopyWithImpl<T,
          _$ResponseWrapperModelImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ResponseWrapperModelImplToJson<T>(this, toJsonT);
  }
}

abstract class _ResponseWrapperModel<T> implements ResponseWrapperModel<T> {
  const factory _ResponseWrapperModel(
      {@JsonKey(name: 'errorMessages') final List<String> messages,
      @JsonKey(name: 'data') final T? data}) = _$ResponseWrapperModelImpl<T>;

  factory _ResponseWrapperModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ResponseWrapperModelImpl<T>.fromJson;

  @override
  @JsonKey(name: 'errorMessages')
  List<String> get messages;
  @override
  @JsonKey(name: 'data')
  T? get data;

  /// Create a copy of ResponseWrapperModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResponseWrapperModelImplCopyWith<T, _$ResponseWrapperModelImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

EmptyDataModel _$EmptyDataModelFromJson(Map<String, dynamic> json) {
  return _EmptyDataModel.fromJson(json);
}

/// @nodoc
mixin _$EmptyDataModel {
  /// Serializes this EmptyDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmptyDataModelCopyWith<$Res> {
  factory $EmptyDataModelCopyWith(
          EmptyDataModel value, $Res Function(EmptyDataModel) then) =
      _$EmptyDataModelCopyWithImpl<$Res, EmptyDataModel>;
}

/// @nodoc
class _$EmptyDataModelCopyWithImpl<$Res, $Val extends EmptyDataModel>
    implements $EmptyDataModelCopyWith<$Res> {
  _$EmptyDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmptyDataModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$EmptyDataModelImplCopyWith<$Res> {
  factory _$$EmptyDataModelImplCopyWith(_$EmptyDataModelImpl value,
          $Res Function(_$EmptyDataModelImpl) then) =
      __$$EmptyDataModelImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyDataModelImplCopyWithImpl<$Res>
    extends _$EmptyDataModelCopyWithImpl<$Res, _$EmptyDataModelImpl>
    implements _$$EmptyDataModelImplCopyWith<$Res> {
  __$$EmptyDataModelImplCopyWithImpl(
      _$EmptyDataModelImpl _value, $Res Function(_$EmptyDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmptyDataModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$EmptyDataModelImpl
    with DiagnosticableTreeMixin
    implements _EmptyDataModel {
  const _$EmptyDataModelImpl();

  factory _$EmptyDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmptyDataModelImplFromJson(json);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EmptyDataModel()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'EmptyDataModel'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyDataModelImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$EmptyDataModelImplToJson(
      this,
    );
  }
}

abstract class _EmptyDataModel implements EmptyDataModel {
  const factory _EmptyDataModel() = _$EmptyDataModelImpl;

  factory _EmptyDataModel.fromJson(Map<String, dynamic> json) =
      _$EmptyDataModelImpl.fromJson;
}
