part of '../core.dart';

abstract class BaseProvider extends ChangeNotifier with BaseStateMixin {
  static void Function(BaseException)? _errorHandler;

  static void setErrorHandler(void Function(BaseException) handler) {
    _errorHandler = handler;
  }

  static void clearErrorHandler() {
    _errorHandler = null;
  }

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

  void loading() {
    status = StateStatus.loading;
    notifyListeners();
  }

  void loaded() {
    status = StateStatus.loaded;
    notifyListeners();
  }
}
