part of '../core.dart';

/// Enumeration of possible state statuses
///
/// Used to track the current state of operations in the application:
/// - [initial] - Initial state, no operation has started
/// - [loading] - Operation is in progress
/// - [refresh] - Data is being refreshed
/// - [loaded] - Operation completed successfully
/// - [info] - Information state with message
/// - [error] - Error state with error message
/// - [event] - Event state for custom events
enum StateStatus {
  initial,
  loading,
  refresh,
  loaded,
  info,
  error,
  event,
}

/// Base interface for state objects
///
/// Provides a common structure for all state classes with
/// status tracking and message handling capabilities.
abstract class BaseStateI {
  /// Current status of the state
  final StateStatus status;

  /// Optional message associated with the state
  final String message;

  const BaseStateI({
    this.status = StateStatus.initial,
    this.message = '',
  });
}

/// Extension providing utility methods for BaseStateI
extension BaseStateIExt on BaseStateI {
  /// Returns true if the state is in a loading state
  bool get statusLoading => [
        StateStatus.loading,
        StateStatus.refresh,
      ].contains(status);
}

/// Mixin providing state management capabilities
///
/// Can be mixed into any class to add status tracking and
/// error message handling functionality.
mixin BaseStateMixin {
  /// Current status of the state
  StateStatus status = StateStatus.initial;

  /// Error message if an error occurred
  String errorMessage = '';
}

/// Extension providing utility methods for BaseStateMixin
extension BaseStateMixinExt on BaseStateMixin {
  /// Returns true if the state is in a loading state
  bool get statusLoading => [
        StateStatus.loading,
        StateStatus.refresh,
      ].contains(status);
}
