/// Base exception class for Flutter Base Kit
///
/// Provides a standardized way to handle errors across the application.
/// All custom exceptions should extend this class to ensure consistent
/// error handling and logging.
///
/// Features:
/// - Customizable error messages
/// - Consistent string representation
/// - Integration with error handling systems
///
/// Usage:
/// ```dart
/// // Basic usage
/// throw BaseException(message: 'Something went wrong');
///
/// // In async operations
/// if (data == null) {
///   throw BaseException(message: 'Data not found');
/// }
///
/// // Custom exception extending BaseException
/// class NetworkException extends BaseException {
///   const NetworkException({super.message = 'Network error occurred'});
/// }
class BaseException implements Exception {
  /// The error message describing what went wrong
  final String message;

  const BaseException({this.message = ''});

  @override
  String toString() => 'App Exception\n$message';
}
