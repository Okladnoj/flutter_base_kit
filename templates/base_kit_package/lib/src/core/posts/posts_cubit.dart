import 'dart:async';

import 'package:flutter_base_kit/flutter_base_kit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../models/example/example_model.dart';
import '../../services/api/posts/posts_service.dart';

part 'posts_state.dart';
part 'posts_cubit.freezed.dart';

@injectable
class PostsCubit extends BaseCubit<PostsState> {
  final PostsService _postsService;

  PostsCubit(this._postsService) : super(const PostsState());

  Future<void> init() async {
    safeAction(() async {
      emit(state.copyWith(status: StateStatus.loaded));
    });
  }

  @override
  Future<void> close() async {
    await super.close();
  }

  Future<void> getPosts() async {
    await safeAction(() async {
      final result = await _postsService.getPosts();
      emit(state.copyWith(posts: result.data));
    });
    emit(state.copyWith(status: StateStatus.loaded));
  }
}
