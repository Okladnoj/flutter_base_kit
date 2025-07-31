// ignore_for_file: invalid_use_of_visible_for_testing_member

part of '../core.dart';

/// Base class for BLoC pattern implementation
///
/// Provides a foundation for implementing BLoC (Business Logic Component)
/// pattern with built-in error handling and safe async operations.
///
/// Features:
/// - Automatic error state management
/// - Safe async operations with error catching
/// - Two error handling strategies (with and without error state)
/// - Automatic state emission for error handling
///
/// Usage:
/// ```dart
/// class MyBloc extends BaseBloc<MyEvent, MyState> {
///   MyBloc() : super(MyState.initial());
///
///   Future<void> fetchData() async {
///     final result = await safeAction(
///       () => apiService.getData(),
///     );
///
///     if (result != null) {
///       emit(state.copyWith(data: result));
///     }
///   }
/// }
/// ```
abstract class BaseBloc<Event extends BaseEventI, State extends BaseStateI>
    extends Bloc<Event, State> {
  BaseBloc(super.initialState);

  /// Handles errors with automatic state emission
  ///
  /// Emits error state followed by loaded state to clear the error
  /// [message] - The exception to handle
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

  /// Handles errors without emitting error state
  ///
  /// Only emits loaded state to clear any previous error
  /// [message] - The exception to handle
  void handleError2(BaseException message) {
    try {
      dynamic state = this.state;
      emit(state.copyWith(status: StateStatus.loaded) as State);
    } catch (_) {}
  }

  /// Executes an async operation with automatic error handling
  ///
  /// Uses [handleError] for error handling (emits error state)
  /// [callback] - The async operation to execute
  ///
  /// Returns the result of the operation or null if it fails
  Future<T?> safeAction<T>(
    AsyncValueGetter<T> callback,
  ) async {
    try {
      return await callback();
    } catch (exception) {
      if (exception is BaseException) {
        handleError(exception);
      } else {
        handleError(BaseException(message: '$exception'));
      }
      return null;
    }
  }

  /// Executes an async operation with minimal error handling
  ///
  /// Uses [handleError2] for error handling (no error state emission)
  /// [callback] - The async operation to execute
  ///
  /// Returns the result of the operation or null if it fails
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
