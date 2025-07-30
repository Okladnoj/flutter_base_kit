part of '../core.dart';

abstract class BaseCubit<State extends BaseStateI> extends Cubit<State> {
  BaseCubit(super.initialState);

  void handleError(BaseException message) {
    try {
      dynamic state = this.state;
      emit(state.copyWith(
        status: StateStatus.error,
        message: message.toString(),
      ) as State);
      emit(state.copyWith(
        status: StateStatus.loaded,
        message: '',
      ) as State);
    } catch (_) {}
  }

  void handleError2(BaseException message) {
    try {
      dynamic state = this.state;
      emit(state.copyWith(status: StateStatus.loaded) as State);
    } catch (_) {}
  }

  Future<T?> safeAction<T>(
    AsyncValueGetter<T> callback, {
    ValueChanged<BaseException>? failureCall,
  }) async {
    try {
      return await callback();
    } catch (exception) {
      if (exception is BaseException) {
        handleError(exception);
        failureCall?.call(exception);
      } else {
        handleError(BaseException(message: '$exception'));
        failureCall?.call(BaseException(message: '$exception'));
      }

      return null;
    }
  }

  Future<T?> safeAction2<T>(
    AsyncValueGetter<T> callback,
  ) async {
    try {
      return await callback();
    } catch (exception) {
      if (exception is BaseException) {
        handleError2(exception);
      } else {
        handleError2(BaseException(message: '$exception'));
      }
      return null;
    }
  }
}
