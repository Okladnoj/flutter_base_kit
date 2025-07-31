// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_wrapper_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResponseWrapperModels<T> implements DiagnosticableTreeMixin {
  @JsonKey(name: 'errorMessages')
  List<String> get messages;
  @JsonKey(name: 'data')
  List<T> get data;

  /// Create a copy of ResponseWrapperModels
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResponseWrapperModelsCopyWith<T, ResponseWrapperModels<T>> get copyWith =>
      _$ResponseWrapperModelsCopyWithImpl<T, ResponseWrapperModels<T>>(
          this as ResponseWrapperModels<T>, _$identity);

  /// Serializes this ResponseWrapperModels to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ResponseWrapperModels<$T>'))
      ..add(DiagnosticsProperty('messages', messages))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponseWrapperModels<T> &&
            const DeepCollectionEquality().equals(other.messages, messages) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(messages),
      const DeepCollectionEquality().hash(data));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponseWrapperModels<$T>(messages: $messages, data: $data)';
  }
}

/// @nodoc
abstract mixin class $ResponseWrapperModelsCopyWith<T, $Res> {
  factory $ResponseWrapperModelsCopyWith(ResponseWrapperModels<T> value,
          $Res Function(ResponseWrapperModels<T>) _then) =
      _$ResponseWrapperModelsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'errorMessages') List<String> messages,
      @JsonKey(name: 'data') List<T> data});
}

/// @nodoc
class _$ResponseWrapperModelsCopyWithImpl<T, $Res>
    implements $ResponseWrapperModelsCopyWith<T, $Res> {
  _$ResponseWrapperModelsCopyWithImpl(this._self, this._then);

  final ResponseWrapperModels<T> _self;
  final $Res Function(ResponseWrapperModels<T>) _then;

  /// Create a copy of ResponseWrapperModels
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? data = null,
  }) {
    return _then(_self.copyWith(
      messages: null == messages
          ? _self.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ResponseWrapperModels].
extension ResponseWrapperModelsPatterns<T> on ResponseWrapperModels<T> {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ResponseWrapperModels<T> value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResponseWrapperModels() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ResponseWrapperModels<T> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResponseWrapperModels():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ResponseWrapperModels<T> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResponseWrapperModels() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'errorMessages') List<String> messages,
            @JsonKey(name: 'data') List<T> data)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResponseWrapperModels() when $default != null:
        return $default(_that.messages, _that.data);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'errorMessages') List<String> messages,
            @JsonKey(name: 'data') List<T> data)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResponseWrapperModels():
        return $default(_that.messages, _that.data);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@JsonKey(name: 'errorMessages') List<String> messages,
            @JsonKey(name: 'data') List<T> data)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResponseWrapperModels() when $default != null:
        return $default(_that.messages, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _ResponseWrapperModels<T>
    with DiagnosticableTreeMixin
    implements ResponseWrapperModels<T> {
  const _ResponseWrapperModels(
      {@JsonKey(name: 'errorMessages') this.messages = const [],
      @JsonKey(name: 'data') this.data = const []});
  factory _ResponseWrapperModels.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ResponseWrapperModelsFromJson(json, fromJsonT);

  @override
  @JsonKey(name: 'errorMessages')
  final List<String> messages;
  @override
  @JsonKey(name: 'data')
  final List<T> data;

  /// Create a copy of ResponseWrapperModels
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResponseWrapperModelsCopyWith<T, _ResponseWrapperModels<T>> get copyWith =>
      __$ResponseWrapperModelsCopyWithImpl<T, _ResponseWrapperModels<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$ResponseWrapperModelsToJson<T>(this, toJsonT);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ResponseWrapperModels<$T>'))
      ..add(DiagnosticsProperty('messages', messages))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResponseWrapperModels<T> &&
            const DeepCollectionEquality().equals(other.messages, messages) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(messages),
      const DeepCollectionEquality().hash(data));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponseWrapperModels<$T>(messages: $messages, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$ResponseWrapperModelsCopyWith<T, $Res>
    implements $ResponseWrapperModelsCopyWith<T, $Res> {
  factory _$ResponseWrapperModelsCopyWith(_ResponseWrapperModels<T> value,
          $Res Function(_ResponseWrapperModels<T>) _then) =
      __$ResponseWrapperModelsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'errorMessages') List<String> messages,
      @JsonKey(name: 'data') List<T> data});
}

/// @nodoc
class __$ResponseWrapperModelsCopyWithImpl<T, $Res>
    implements _$ResponseWrapperModelsCopyWith<T, $Res> {
  __$ResponseWrapperModelsCopyWithImpl(this._self, this._then);

  final _ResponseWrapperModels<T> _self;
  final $Res Function(_ResponseWrapperModels<T>) _then;

  /// Create a copy of ResponseWrapperModels
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? messages = null,
    Object? data = null,
  }) {
    return _then(_ResponseWrapperModels<T>(
      messages: null == messages
          ? _self.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
mixin _$ResponseWrapperModel<T> implements DiagnosticableTreeMixin {
  @JsonKey(name: 'errorMessages')
  List<String> get messages;
  @JsonKey(name: 'data')
  T? get data;

  /// Create a copy of ResponseWrapperModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResponseWrapperModelCopyWith<T, ResponseWrapperModel<T>> get copyWith =>
      _$ResponseWrapperModelCopyWithImpl<T, ResponseWrapperModel<T>>(
          this as ResponseWrapperModel<T>, _$identity);

  /// Serializes this ResponseWrapperModel to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ResponseWrapperModel<$T>'))
      ..add(DiagnosticsProperty('messages', messages))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResponseWrapperModel<T> &&
            const DeepCollectionEquality().equals(other.messages, messages) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(messages),
      const DeepCollectionEquality().hash(data));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponseWrapperModel<$T>(messages: $messages, data: $data)';
  }
}

/// @nodoc
abstract mixin class $ResponseWrapperModelCopyWith<T, $Res> {
  factory $ResponseWrapperModelCopyWith(ResponseWrapperModel<T> value,
          $Res Function(ResponseWrapperModel<T>) _then) =
      _$ResponseWrapperModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'errorMessages') List<String> messages,
      @JsonKey(name: 'data') T? data});
}

/// @nodoc
class _$ResponseWrapperModelCopyWithImpl<T, $Res>
    implements $ResponseWrapperModelCopyWith<T, $Res> {
  _$ResponseWrapperModelCopyWithImpl(this._self, this._then);

  final ResponseWrapperModel<T> _self;
  final $Res Function(ResponseWrapperModel<T>) _then;

  /// Create a copy of ResponseWrapperModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? data = freezed,
  }) {
    return _then(_self.copyWith(
      messages: null == messages
          ? _self.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ResponseWrapperModel].
extension ResponseWrapperModelPatterns<T> on ResponseWrapperModel<T> {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ResponseWrapperModel<T> value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResponseWrapperModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ResponseWrapperModel<T> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResponseWrapperModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ResponseWrapperModel<T> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResponseWrapperModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'errorMessages') List<String> messages,
            @JsonKey(name: 'data') T? data)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResponseWrapperModel() when $default != null:
        return $default(_that.messages, _that.data);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@JsonKey(name: 'errorMessages') List<String> messages,
            @JsonKey(name: 'data') T? data)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResponseWrapperModel():
        return $default(_that.messages, _that.data);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@JsonKey(name: 'errorMessages') List<String> messages,
            @JsonKey(name: 'data') T? data)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResponseWrapperModel() when $default != null:
        return $default(_that.messages, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _ResponseWrapperModel<T>
    with DiagnosticableTreeMixin
    implements ResponseWrapperModel<T> {
  const _ResponseWrapperModel(
      {@JsonKey(name: 'errorMessages') this.messages = const [],
      @JsonKey(name: 'data') this.data});
  factory _ResponseWrapperModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ResponseWrapperModelFromJson(json, fromJsonT);

  @override
  @JsonKey(name: 'errorMessages')
  final List<String> messages;
  @override
  @JsonKey(name: 'data')
  final T? data;

  /// Create a copy of ResponseWrapperModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResponseWrapperModelCopyWith<T, _ResponseWrapperModel<T>> get copyWith =>
      __$ResponseWrapperModelCopyWithImpl<T, _ResponseWrapperModel<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$ResponseWrapperModelToJson<T>(this, toJsonT);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'ResponseWrapperModel<$T>'))
      ..add(DiagnosticsProperty('messages', messages))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResponseWrapperModel<T> &&
            const DeepCollectionEquality().equals(other.messages, messages) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(messages),
      const DeepCollectionEquality().hash(data));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponseWrapperModel<$T>(messages: $messages, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$ResponseWrapperModelCopyWith<T, $Res>
    implements $ResponseWrapperModelCopyWith<T, $Res> {
  factory _$ResponseWrapperModelCopyWith(_ResponseWrapperModel<T> value,
          $Res Function(_ResponseWrapperModel<T>) _then) =
      __$ResponseWrapperModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'errorMessages') List<String> messages,
      @JsonKey(name: 'data') T? data});
}

/// @nodoc
class __$ResponseWrapperModelCopyWithImpl<T, $Res>
    implements _$ResponseWrapperModelCopyWith<T, $Res> {
  __$ResponseWrapperModelCopyWithImpl(this._self, this._then);

  final _ResponseWrapperModel<T> _self;
  final $Res Function(_ResponseWrapperModel<T>) _then;

  /// Create a copy of ResponseWrapperModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? messages = null,
    Object? data = freezed,
  }) {
    return _then(_ResponseWrapperModel<T>(
      messages: null == messages
          ? _self.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
mixin _$EmptyDataModel implements DiagnosticableTreeMixin {
  /// Serializes this EmptyDataModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'EmptyDataModel'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EmptyDataModel);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EmptyDataModel()';
  }
}

/// @nodoc
class $EmptyDataModelCopyWith<$Res> {
  $EmptyDataModelCopyWith(EmptyDataModel _, $Res Function(EmptyDataModel) __);
}

/// Adds pattern-matching-related methods to [EmptyDataModel].
extension EmptyDataModelPatterns on EmptyDataModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EmptyDataModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmptyDataModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EmptyDataModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmptyDataModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EmptyDataModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmptyDataModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmptyDataModel() when $default != null:
        return $default();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmptyDataModel():
        return $default();
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmptyDataModel() when $default != null:
        return $default();
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _EmptyDataModel with DiagnosticableTreeMixin implements EmptyDataModel {
  const _EmptyDataModel();
  factory _EmptyDataModel.fromJson(Map<String, dynamic> json) =>
      _$EmptyDataModelFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return _$EmptyDataModelToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'EmptyDataModel'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _EmptyDataModel);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EmptyDataModel()';
  }
}

// dart format on
