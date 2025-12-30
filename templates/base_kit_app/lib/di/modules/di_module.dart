import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
@immutable
abstract class DiModule {
  @preResolve
  Future<SharedPreferences> sharedPreferences() async {
    return await _fRegistered<SharedPreferences>(SharedPreferences.getInstance);
  }

  FlutterSecureStorage get secureStorage {
    return _sRegistered<FlutterSecureStorage>(FlutterSecureStorage.new);
  }

  @preResolve
  Future<PackageInfo> packageInfo() async {
    return await _fRegistered<PackageInfo>(PackageInfo.fromPlatform);
  }

  DeviceInfoPlugin deviceInfo() {
    return _sRegistered<DeviceInfoPlugin>(DeviceInfoPlugin.new);
  }
}

Future<T> _fRegistered<T extends Object>(Future<T> Function() factory) async {
  final getIt = GetIt.I;
  try {
    if (getIt.isRegistered<T>()) {
      return getIt<T>();
    }
  } catch (_) {}
  return await factory();
}

T _sRegistered<T extends Object>(T Function() factory) {
  final getIt = GetIt.I;
  try {
    if (getIt.isRegistered<T>()) {
      return getIt<T>();
    }
  } catch (_) {}
  return factory();
}
