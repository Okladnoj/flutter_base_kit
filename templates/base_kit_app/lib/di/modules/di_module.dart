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
    final getIt = GetIt.I;
    if (getIt.isRegistered<SharedPreferences>()) {
      return getIt<SharedPreferences>();
    }
    return SharedPreferences.getInstance();
  }

  FlutterSecureStorage get secureStorage {
    final getIt = GetIt.I;
    if (getIt.isRegistered<FlutterSecureStorage>()) {
      return getIt<FlutterSecureStorage>();
    }
    return const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(),
    );
  }

  @preResolve
  Future<PackageInfo> packageInfo() async {
    final getIt = GetIt.I;
    if (getIt.isRegistered<PackageInfo>()) {
      return getIt<PackageInfo>();
    }
    return PackageInfo.fromPlatform();
  }

  DeviceInfoPlugin deviceInfo() {
    final getIt = GetIt.I;
    if (getIt.isRegistered<DeviceInfoPlugin>()) {
      return getIt<DeviceInfoPlugin>();
    }
    return DeviceInfoPlugin();
  }
}
