part of 'posts_cubit.dart';

@freezed
class PostsState extends BaseStateI with _$PostsState {
  const PostsState._();

  const factory PostsState({
    @Default(StateStatus.initial) StateStatus status,
    @Default('') String message,
    @Default([]) List<ExampleModel> posts,
  }) = _PostsState;
}
