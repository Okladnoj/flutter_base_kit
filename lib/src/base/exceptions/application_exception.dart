import 'base_exception.dart';

class ApplicationException extends BaseException {
  const ApplicationException(String message) : super(message: message);

  @override
  String toString() => message;
}
