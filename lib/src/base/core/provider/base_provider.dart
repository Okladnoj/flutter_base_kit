part of '../core.dart';

/// Base class for ChangeNotifier-based state management
///
/// Provides a foundation for implementing state management using
/// Flutter's ChangeNotifier pattern with built-in error handling,
/// loading states, and logging capabilities.
///
/// Features:
/// - Global error handler registration
/// - Safe async operations with error catching
/// - Loading state management
/// - Automatic error logging
///
/// Usage:
/// ```dart
/// class MyProvider extends BaseProvider {
///   Future<void> fetchData() async {
///     loading();
///
///     final result = await safeAction(
///       () => apiService.getData(),
///       failureCall: (error) => print('Failed: $error'),
///     );
///
///     if (result != null) {
///       // Handle success
///       loaded();
///     }
///   }
/// }
/// ```
abstract class BaseProvider extends ChangeNotifier with BaseStateMixin {
  static void Function(BaseException)? _errorHandler;

  /// Sets a global error handler for all BaseProvider instances
  ///
  /// [handler] - Function to handle errors globally
  static void setErrorHandler(void Function(BaseException) handler) {
    _errorHandler = handler;
  }

  /// Clears the global error handler
  static void clearErrorHandler() {
    _errorHandler = null;
  }

  /// Handles errors with automatic state management and logging
  ///
  /// [message] - The exception to handle
  void handleError(BaseException message) {
    try {
      status = StateStatus.error;
      errorMessage = message.toString();
      loggerApp.e(errorMessage);
      _errorHandler?.call(message);
      notifyListeners();

      status = StateStatus.loaded;
      errorMessage = '';
      notifyListeners();
    } catch (_) {}
  }

  /// Executes an async operation with automatic error handling
  ///
  /// [callback] - The async operation to execute
  /// [failureCall] - Optional callback for error handling
  ///
  /// Returns the result of the operation or null if it fails
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

  /// Sets the state to loading and notifies listeners
  void loading() {
    status = StateStatus.loading;
    notifyListeners();
  }

  /// Sets the state to loaded and notifies listeners
  void loaded() {
    status = StateStatus.loaded;
    notifyListeners();
  }
}
