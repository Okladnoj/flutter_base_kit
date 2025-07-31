// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'example_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExampleState {
  StateStatus get status;
  String get message;
  List<ExampleModel> get posts;

  /// Create a copy of ExampleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExampleStateCopyWith<ExampleState> get copyWith =>
      _$ExampleStateCopyWithImpl<ExampleState>(
          this as ExampleState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExampleState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.posts, posts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(posts));

  @override
  String toString() {
    return 'ExampleState(status: $status, message: $message, posts: $posts)';
  }
}

/// @nodoc
abstract mixin class $ExampleStateCopyWith<$Res> {
  factory $ExampleStateCopyWith(
          ExampleState value, $Res Function(ExampleState) _then) =
      _$ExampleStateCopyWithImpl;
  @useResult
  $Res call({StateStatus status, String message, List<ExampleModel> posts});
}

/// @nodoc
class _$ExampleStateCopyWithImpl<$Res> implements $ExampleStateCopyWith<$Res> {
  _$ExampleStateCopyWithImpl(this._self, this._then);

  final ExampleState _self;
  final $Res Function(ExampleState) _then;

  /// Create a copy of ExampleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? posts = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      posts: null == posts
          ? _self.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<ExampleModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ExampleState].
extension ExampleStatePatterns on ExampleState {
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
    TResult Function(_ExampleState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExampleState() when $default != null:
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
    TResult Function(_ExampleState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExampleState():
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
    TResult? Function(_ExampleState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExampleState() when $default != null:
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
    TResult Function(
            StateStatus status, String message, List<ExampleModel> posts)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExampleState() when $default != null:
        return $default(_that.status, _that.message, _that.posts);
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
    TResult Function(
            StateStatus status, String message, List<ExampleModel> posts)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExampleState():
        return $default(_that.status, _that.message, _that.posts);
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
    TResult? Function(
            StateStatus status, String message, List<ExampleModel> posts)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExampleState() when $default != null:
        return $default(_that.status, _that.message, _that.posts);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ExampleState extends ExampleState {
  const _ExampleState(
      {this.status = StateStatus.initial,
      this.message = '',
      final List<ExampleModel> posts = const []})
      : _posts = posts,
        super._();

  @override
  @JsonKey()
  final StateStatus status;
  @override
  @JsonKey()
  final String message;
  final List<ExampleModel> _posts;
  @override
  @JsonKey()
  List<ExampleModel> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  /// Create a copy of ExampleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExampleStateCopyWith<_ExampleState> get copyWith =>
      __$ExampleStateCopyWithImpl<_ExampleState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExampleState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, message,
      const DeepCollectionEquality().hash(_posts));

  @override
  String toString() {
    return 'ExampleState(status: $status, message: $message, posts: $posts)';
  }
}

/// @nodoc
abstract mixin class _$ExampleStateCopyWith<$Res>
    implements $ExampleStateCopyWith<$Res> {
  factory _$ExampleStateCopyWith(
          _ExampleState value, $Res Function(_ExampleState) _then) =
      __$ExampleStateCopyWithImpl;
  @override
  @useResult
  $Res call({StateStatus status, String message, List<ExampleModel> posts});
}

/// @nodoc
class __$ExampleStateCopyWithImpl<$Res>
    implements _$ExampleStateCopyWith<$Res> {
  __$ExampleStateCopyWithImpl(this._self, this._then);

  final _ExampleState _self;
  final $Res Function(_ExampleState) _then;

  /// Create a copy of ExampleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? posts = null,
  }) {
    return _then(_ExampleState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      posts: null == posts
          ? _self._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<ExampleModel>,
    ));
  }
}

// dart format on
