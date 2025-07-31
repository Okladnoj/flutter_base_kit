/// Utility class for common form validations
///
/// Provides a comprehensive set of validation methods for common
/// form fields including email, phone, password, and general text validation.
///
/// Features:
/// - Email validation with regex pattern
/// - Phone number validation (basic international format)
/// - Password strength validation
/// - Required field validation
/// - Length validation (min/max)
/// - Customizable error messages
///
/// Usage:
/// ```dart
/// // Email validation
/// final emailError = Validators.validateEmail(
///   emailController.text,
///   emptyMessage: 'Email is required',
///   invalidMessage: 'Please enter a valid email',
/// );
///
/// // Password validation
/// final passwordError = Validators.validatePassword(
///   passwordController.text,
///   weakMessage: 'Password is too weak',
/// );
///
/// // Required field validation
/// final nameError = Validators.validateRequired(
///   nameController.text,
///   message: 'Name is required',
/// );
///
/// // Length validation
/// final bioError = Validators.validateMaxLength(
///   bioController.text,
///   500,
///   message: 'Bio must be less than 500 characters',
/// );
/// ```
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
  ///
  /// [value] - Email string to validate
  /// [emptyMessage] - Custom message for empty field
  /// [invalidMessage] - Custom message for invalid email format
  ///
  /// Returns error message if validation fails, null if valid
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
  ///
  /// [value] - Phone string to validate
  /// [emptyMessage] - Custom message for empty field
  /// [invalidMessage] - Custom message for invalid phone format
  ///
  /// Returns error message if validation fails, null if valid
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
  ///
  /// [value] - Password string to validate
  /// [emptyMessage] - Custom message for empty field
  /// [weakMessage] - Custom message for weak password
  ///
  /// Returns error message if validation fails, null if valid
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
  ///
  /// [value] - String to validate
  /// [message] - Custom message for empty field
  ///
  /// Returns error message if validation fails, null if valid
  static String? validateRequired(String? value, {String? message}) {
    if (value == null || value.trim().isEmpty) {
      return message ?? 'This field is required';
    }
    return null;
  }

  /// Validate minimum length
  ///
  /// [value] - String to validate
  /// [minLength] - Minimum required length
  /// [message] - Custom message for validation failure
  ///
  /// Returns error message if validation fails, null if valid
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
  ///
  /// [value] - String to validate
  /// [maxLength] - Maximum allowed length
  /// [message] - Custom message for validation failure
  ///
  /// Returns error message if validation fails, null if valid
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
