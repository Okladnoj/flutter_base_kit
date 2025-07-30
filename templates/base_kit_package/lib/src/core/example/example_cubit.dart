import 'dart:async';

import 'package:flutter_base_kit/flutter_base_kit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../models/example/example_model.dart';
import '../../services/api/example/example_service.dart';

part 'example_state.dart';
part 'example_cubit.freezed.dart';

@injectable
class ExampleCubit extends BaseCubit<ExampleState> {
  final ExampleService _exampleService;

  ExampleCubit(this._exampleService) : super(const ExampleState());

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
      final result = await _exampleService.getPosts();
      emit(state.copyWith(posts: result.data));
    });
    emit(state.copyWith(status: StateStatus.loaded));
  }
}
