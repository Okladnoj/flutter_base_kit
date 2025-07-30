// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'example_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExampleState {
  StateStatus get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<ExampleModel> get posts => throw _privateConstructorUsedError;

  /// Create a copy of ExampleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExampleStateCopyWith<ExampleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExampleStateCopyWith<$Res> {
  factory $ExampleStateCopyWith(
          ExampleState value, $Res Function(ExampleState) then) =
      _$ExampleStateCopyWithImpl<$Res, ExampleState>;
  @useResult
  $Res call({StateStatus status, String message, List<ExampleModel> posts});
}

/// @nodoc
class _$ExampleStateCopyWithImpl<$Res, $Val extends ExampleState>
    implements $ExampleStateCopyWith<$Res> {
  _$ExampleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExampleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? posts = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<ExampleModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExampleStateImplCopyWith<$Res>
    implements $ExampleStateCopyWith<$Res> {
  factory _$$ExampleStateImplCopyWith(
          _$ExampleStateImpl value, $Res Function(_$ExampleStateImpl) then) =
      __$$ExampleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StateStatus status, String message, List<ExampleModel> posts});
}

/// @nodoc
class __$$ExampleStateImplCopyWithImpl<$Res>
    extends _$ExampleStateCopyWithImpl<$Res, _$ExampleStateImpl>
    implements _$$ExampleStateImplCopyWith<$Res> {
  __$$ExampleStateImplCopyWithImpl(
      _$ExampleStateImpl _value, $Res Function(_$ExampleStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExampleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? posts = null,
  }) {
    return _then(_$ExampleStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<ExampleModel>,
    ));
  }
}

/// @nodoc

class _$ExampleStateImpl extends _ExampleState {
  const _$ExampleStateImpl(
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

  @override
  String toString() {
    return 'ExampleState(status: $status, message: $message, posts: $posts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExampleStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, message,
      const DeepCollectionEquality().hash(_posts));

  /// Create a copy of ExampleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExampleStateImplCopyWith<_$ExampleStateImpl> get copyWith =>
      __$$ExampleStateImplCopyWithImpl<_$ExampleStateImpl>(this, _$identity);
}

abstract class _ExampleState extends ExampleState {
  const factory _ExampleState(
      {final StateStatus status,
      final String message,
      final List<ExampleModel> posts}) = _$ExampleStateImpl;
  const _ExampleState._() : super._();

  @override
  StateStatus get status;
  @override
  String get message;
  @override
  List<ExampleModel> get posts;

  /// Create a copy of ExampleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExampleStateImplCopyWith<_$ExampleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
