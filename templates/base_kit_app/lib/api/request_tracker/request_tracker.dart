import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_kit/flutter_base_kit.dart';
import 'package:injectable/injectable.dart';

import '../../di/di.dart';

@lazySingleton
class RequestTracker with WidgetsBindingObserver {
  RequestTracker() {
    WidgetsBinding.instance.addObserver(this);
  }

  Dio get _dio => locator<Dio>();

  int _active = 0;
  bool _pendingReset = false;
  Timer? _timer;
  DateTime? _lastBackgroundTime;

  void start() {
    _timer?.cancel();
    _timer = null;
    _pendingReset = false;
    _active++;
    loggerApp.i('RequestTracker start ($_active)');
  }

  void done() {
    _active--;
    loggerApp.i('RequestTracker done ($_active)');
    if (_active <= 0 && _pendingReset) _scheduleFlush();
  }

  void _scheduleReset() {
    if (_active <= 0) {
      _scheduleFlush();
    } else {
      _pendingReset = true;
    }
  }

  void _scheduleFlush() {
    _active = 0;
    _timer?.cancel();
    _timer = Timer(const Duration(minutes: 1), () {
      _pendingReset = false;
      _timer = null;
      loggerApp.i('RequestTracker flush after 1 minute of inactivity');
      _dio.httpClientAdapter.close(force: true);
      _dio.httpClientAdapter = HttpClientAdapter();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
        _lastBackgroundTime = DateTime.now();
        _scheduleReset();
        break;
      case AppLifecycleState.resumed:
        _handleAppResume();
        break;
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        break;
    }
  }

  void _handleAppResume() {
    final now = DateTime.now();
    final backgroundTime = _lastBackgroundTime;

    if (backgroundTime != null) {
      final inactiveMinutes = now.difference(backgroundTime).inMinutes;
      loggerApp.i('App resumed after $inactiveMinutes minutes');

      if (inactiveMinutes > 5) {
        loggerApp.i(
          'Force resetting HTTP adapter after long inactivity ($inactiveMinutes minutes)',
        );
        _timer?.cancel();
        _timer = null;
        _pendingReset = false;
        _dio.httpClientAdapter.close(force: true);
        _dio.httpClientAdapter = HttpClientAdapter();
      } else {
        _scheduleReset();
      }
    }

    _lastBackgroundTime = null;
  }
}
