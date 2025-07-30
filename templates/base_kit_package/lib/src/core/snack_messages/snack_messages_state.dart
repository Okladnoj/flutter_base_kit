import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base_kit/flutter_base_kit.dart';
import 'package:injectable/injectable.dart';

import '../../di/di.dart';

@singleton
class SnackMessagesState extends BaseProvider {
  static SnackMessagesState get _instance => locator();

  final _messages = <String>[];
  String? message;
  Timer? _timer;

  static void showMessage(String message) => _instance._showMessage(message);
  static void clearAll() => _instance._clearAll();
  static void close() => _instance._close();

  void _showMessage(String message) {
    _messages.add(message);
    _messageShower();
  }

  void _clearAll() {
    _messages.clear();
    message = null;
    _timer?.cancel();
    notifyListeners();
  }

  void _close() async {
    message = null;
    _timer?.cancel();
    notifyListeners();
    await Future.delayed(Durations.long2);
    _messageShower();
  }

  void _messageShower() {
    if (_timer != null && _timer!.isActive) return;

    if (_messages.isEmpty) {
      message = null;
      notifyListeners();
      return;
    }

    message = _messages.removeLast();
    notifyListeners();

    _timer = Timer(const Duration(seconds: 5), () {
      message = null;
      notifyListeners();
      if (_messages.isNotEmpty) {
        _messageShower();
      }
    });
  }
}
