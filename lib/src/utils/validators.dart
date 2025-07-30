/// Utility class for common validations
abstract class Validators {
  /// Email validation pattern
  static const String _emailPattern =
      r'^[a-zA-Z0-9._\+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  /// Phone validation pattern (basic)
  static const String _phonePattern = r'^\+?[\d\s\-\(\)]{10,}$';

  /// Password validation pattern (at least 8 chars, 1 uppercase, 1 lowercase, 1 number)
  static const String _passwordPattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d@$!%*?&]{8,}$';

  /// Validate email address
  static String? validateEmail(
    String? value, {
    String? emptyMessage,
    String? invalidMessage,
  }) {
    if (value == null || value.isEmpty) {
      return emptyMessage ?? 'Field cannot be empty';
    }
    if (!RegExp(_emailPattern).hasMatch(value)) {
      return invalidMessage ?? 'Please enter a valid email address';
    }
    return null;
  }

  /// Validate phone number
  static String? validatePhone(
    String? value, {
    String? emptyMessage,
    String? invalidMessage,
  }) {
    if (value == null || value.isEmpty) {
      return emptyMessage ?? 'Field cannot be empty';
    }
    if (!RegExp(_phonePattern).hasMatch(value)) {
      return invalidMessage ?? 'Please enter a valid phone number';
    }
    return null;
  }

  /// Validate password strength
  static String? validatePassword(
    String? value, {
    String? emptyMessage,
    String? weakMessage,
  }) {
    if (value == null || value.isEmpty) {
      return emptyMessage ?? 'Field cannot be empty';
    }
    if (value.length < 8) {
      return weakMessage ?? 'Password must be at least 8 characters long';
    }
    if (!RegExp(_passwordPattern).hasMatch(value)) {
      return weakMessage ??
          'Password must contain uppercase, lowercase, and number';
    }
    return null;
  }

  /// Validate required field
  static String? validateRequired(String? value, {String? message}) {
    if (value == null || value.trim().isEmpty) {
      return message ?? 'This field is required';
    }
    return null;
  }

  /// Validate minimum length
  static String? validateMinLength(
    String? value,
    int minLength, {
    String? message,
  }) {
    if (value == null || value.length < minLength) {
      return message ?? 'Must be at least $minLength characters long';
    }
    return null;
  }

  /// Validate maximum length
  static String? validateMaxLength(
    String? value,
    int maxLength, {
    String? message,
  }) {
    if (value != null && value.length > maxLength) {
      return message ?? 'Must be no more than $maxLength characters long';
    }
    return null;
  }
}
