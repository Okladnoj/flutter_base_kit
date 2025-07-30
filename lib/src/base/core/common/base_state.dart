part of '../core.dart';

enum StateStatus {
  initial,
  loading,
  refresh,
  loaded,
  info,
  error,
  event,
}

abstract class BaseStateI {
  final StateStatus status;
  final String message;

  const BaseStateI({
    this.status = StateStatus.initial,
    this.message = '',
  });
}

extension BaseStateIExt on BaseStateI {
  bool get statusLoading => [
        StateStatus.loading,
        StateStatus.refresh,
      ].contains(status);
}

mixin BaseStateMixin {
  StateStatus status = StateStatus.initial;
  String errorMessage = '';
}

extension BaseStateMixinExt on BaseStateMixin {
  bool get statusLoading => [
        StateStatus.loading,
        StateStatus.refresh,
      ].contains(status);
}
