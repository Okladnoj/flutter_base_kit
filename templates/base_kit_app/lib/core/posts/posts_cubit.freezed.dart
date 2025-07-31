// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostsState {
  StateStatus get status;
  String get message;
  List<ExampleModel> get posts;

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostsStateCopyWith<PostsState> get copyWith =>
      _$PostsStateCopyWithImpl<PostsState>(this as PostsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PostsState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.posts, posts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, message, const DeepCollectionEquality().hash(posts));

  @override
  String toString() {
    return 'PostsState(status: $status, message: $message, posts: $posts)';
  }
}

/// @nodoc
abstract mixin class $PostsStateCopyWith<$Res> {
  factory $PostsStateCopyWith(
          PostsState value, $Res Function(PostsState) _then) =
      _$PostsStateCopyWithImpl;
  @useResult
  $Res call({StateStatus status, String message, List<ExampleModel> posts});
}

/// @nodoc
class _$PostsStateCopyWithImpl<$Res> implements $PostsStateCopyWith<$Res> {
  _$PostsStateCopyWithImpl(this._self, this._then);

  final PostsState _self;
  final $Res Function(PostsState) _then;

  /// Create a copy of PostsState
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

/// Adds pattern-matching-related methods to [PostsState].
extension PostsStatePatterns on PostsState {
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
    TResult Function(_PostsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PostsState() when $default != null:
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
    TResult Function(_PostsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostsState():
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
    TResult? Function(_PostsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PostsState() when $default != null:
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
      case _PostsState() when $default != null:
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
      case _PostsState():
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
      case _PostsState() when $default != null:
        return $default(_that.status, _that.message, _that.posts);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PostsState extends PostsState {
  const _PostsState(
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

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PostsStateCopyWith<_PostsState> get copyWith =>
      __$PostsStateCopyWithImpl<_PostsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostsState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, message,
      const DeepCollectionEquality().hash(_posts));

  @override
  String toString() {
    return 'PostsState(status: $status, message: $message, posts: $posts)';
  }
}

/// @nodoc
abstract mixin class _$PostsStateCopyWith<$Res>
    implements $PostsStateCopyWith<$Res> {
  factory _$PostsStateCopyWith(
          _PostsState value, $Res Function(_PostsState) _then) =
      __$PostsStateCopyWithImpl;
  @override
  @useResult
  $Res call({StateStatus status, String message, List<ExampleModel> posts});
}

/// @nodoc
class __$PostsStateCopyWithImpl<$Res> implements _$PostsStateCopyWith<$Res> {
  __$PostsStateCopyWithImpl(this._self, this._then);

  final _PostsState _self;
  final $Res Function(_PostsState) _then;

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? posts = null,
  }) {
    return _then(_PostsState(
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
