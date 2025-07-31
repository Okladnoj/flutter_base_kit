part of '../core.dart';

/// Base interface for BLoC events
///
/// All events in the BLoC pattern should extend this interface
/// to ensure consistency and type safety across the application.
///
/// Usage:
/// ```dart
/// class FetchDataEvent extends BaseEventI {
///   const FetchDataEvent();
/// }
///
/// class UpdateDataEvent extends BaseEventI {
///   final String data;
///   const UpdateDataEvent(this.data);
/// }
/// ```
abstract class BaseEventI {
  const BaseEventI();
}
