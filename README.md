# Flutter Base Kit

A comprehensive Flutter development kit with base classes, utilities, and common patterns for faster app development.

## Features

- **Base Classes**: Pre-built Cubit, State, and Exception classes
- **Utilities**: Logger, validators, and helper functions
- **Extensions**: Useful extensions for String, Color, and other types
- **Error Handling**: Built-in error handling patterns
- **Type Safety**: Full type safety with Equatable integration

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_base_kit: ^0.0.1
```

## Usage

### Import the package

```dart
import 'package:flutter_base_kit/flutter_base_kit.dart';
```

### Base Cubit

Create a Cubit with built-in error handling:

```dart
class UserCubit extends BaseCubit<UserState> {
  UserCubit() : super(const UserState());

  Future<void> loadUser() async {
    await safeAction(
      () async {
        // Your async operation here
        final user = await userRepository.getUser();
        emit(state.copyWith(user: user, status: StateStatus.loaded));
      },
      failureCall: (exception) {
        // Handle failure
        loggerApp.e('Failed to load user: ${exception.message}');
      },
    );
  }
}
```

### Base State

Create a state class:

```dart
class UserState extends BaseStateI {
  final User? user;

  const UserState({
    super.status,
    super.message,
    this.user,
  });

  UserState copyWith({
    StateStatus? status,
    String? message,
    User? user,
  }) {
    return UserState(
      status: status ?? this.status,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [status, message, user];
}
```

### Logger

Use the built-in logger:

```dart
loggerApp.i('Info message');
loggerApp.d('Debug message');
loggerApp.w('Warning message');
loggerApp.e('Error message', error: error, stackTrace: stackTrace);
```

### Validators

Use built-in validators:

```dart
// Email validation
final emailError = Validators.validateEmail(emailController.text);

// Password validation
final passwordError = Validators.validatePassword(passwordController.text);

// Required field validation
final nameError = Validators.validateRequired(nameController.text);
```

### Extensions

Use helpful extensions:

```dart
// String extensions
final color = '#FF5733'.toColor;
final capitalized = 'hello world'.capitalize; // "Hello world"
final titleCase = 'hello world'.toTitleCase; // "Hello World"
final isEmail = 'test@example.com'.isEmail; // true

// Color extensions
final hex = Colors.red.toHex; // "#FF0000"
final darker = Colors.red.darken(0.2);
final lighter = Colors.red.lighten(0.2);
final contrasting = Colors.red.contrastingColor; // White or black
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
