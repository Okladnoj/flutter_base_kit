import 'dart:async';

import 'package:flutter_base_kit/flutter_base_kit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../models/example/example_model.dart';
import '../../services/api/example/example_service.dart';
import '../../services/app_db/example/example_db_service.dart';

part 'example_state.dart';
part 'example_cubit.freezed.dart';

@injectable
class ExampleCubit extends BaseCubit<ExampleState> {
  final ExampleService _exampleService;
  final ExampleDbService _exampleDbService;

  ExampleCubit(this._exampleService, this._exampleDbService)
    : super(const ExampleState());

  StreamSubscription<List<ExampleModel>>? _postsSubscription;

  Future<void> init() async {
    await _postsSubscription?.cancel();
    _postsSubscription = _exampleDbService.watchAll().listen(
      _onCachedPostsChanged,
      onError: _onCachedPostsError,
    );
    emit(state.copyWith(status: StateStatus.loaded));
  }

  void _onCachedPostsChanged(List<ExampleModel> posts) {
    emit(state.copyWith(posts: posts));
  }

  void _onCachedPostsError(Object error) {
    handleError(BaseException(message: '$error'));
  }

  @override
  Future<void> close() async {
    await _postsSubscription?.cancel();
    await super.close();
  }

  Future<void> getPosts() async {
    await safeAction(() async {
      emit(state.copyWith(status: StateStatus.refresh));
      final result = await _exampleService.getPosts();
      await _exampleDbService.saveAll(result.data);
    });
    emit(state.copyWith(status: StateStatus.loaded));
  }

  Future<void> clearCachedPosts() async {
    await safeAction(_exampleDbService.deleteAll);
  }
}
