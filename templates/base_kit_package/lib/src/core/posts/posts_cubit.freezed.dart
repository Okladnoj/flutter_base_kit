// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PostsState {
  StateStatus get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<ExampleModel> get posts => throw _privateConstructorUsedError;

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostsStateCopyWith<PostsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsStateCopyWith<$Res> {
  factory $PostsStateCopyWith(
    PostsState value,
    $Res Function(PostsState) then,
  ) = _$PostsStateCopyWithImpl<$Res, PostsState>;
  @useResult
  $Res call({StateStatus status, String message, List<ExampleModel> posts});
}

/// @nodoc
class _$PostsStateCopyWithImpl<$Res, $Val extends PostsState>
    implements $PostsStateCopyWith<$Res> {
  _$PostsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? posts = null,
  }) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as StateStatus,
            message:
                null == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String,
            posts:
                null == posts
                    ? _value.posts
                    : posts // ignore: cast_nullable_to_non_nullable
                        as List<ExampleModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PostsStateImplCopyWith<$Res>
    implements $PostsStateCopyWith<$Res> {
  factory _$$PostsStateImplCopyWith(
    _$PostsStateImpl value,
    $Res Function(_$PostsStateImpl) then,
  ) = __$$PostsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StateStatus status, String message, List<ExampleModel> posts});
}

/// @nodoc
class __$$PostsStateImplCopyWithImpl<$Res>
    extends _$PostsStateCopyWithImpl<$Res, _$PostsStateImpl>
    implements _$$PostsStateImplCopyWith<$Res> {
  __$$PostsStateImplCopyWithImpl(
    _$PostsStateImpl _value,
    $Res Function(_$PostsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? posts = null,
  }) {
    return _then(
      _$PostsStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as StateStatus,
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
        posts:
            null == posts
                ? _value._posts
                : posts // ignore: cast_nullable_to_non_nullable
                    as List<ExampleModel>,
      ),
    );
  }
}

/// @nodoc

class _$PostsStateImpl extends _PostsState {
  const _$PostsStateImpl({
    this.status = StateStatus.initial,
    this.message = '',
    final List<ExampleModel> posts = const [],
  }) : _posts = posts,
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
    return 'PostsState(status: $status, message: $message, posts: $posts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    message,
    const DeepCollectionEquality().hash(_posts),
  );

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostsStateImplCopyWith<_$PostsStateImpl> get copyWith =>
      __$$PostsStateImplCopyWithImpl<_$PostsStateImpl>(this, _$identity);
}

abstract class _PostsState extends PostsState {
  const factory _PostsState({
    final StateStatus status,
    final String message,
    final List<ExampleModel> posts,
  }) = _$PostsStateImpl;
  const _PostsState._() : super._();

  @override
  StateStatus get status;
  @override
  String get message;
  @override
  List<ExampleModel> get posts;

  /// Create a copy of PostsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostsStateImplCopyWith<_$PostsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
