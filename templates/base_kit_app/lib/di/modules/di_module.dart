import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
@immutable
abstract class DiModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  FlutterSecureStorage get secureStorage {
    return const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(),
    );
  }

  @preResolve
  Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();

  DeviceInfoPlugin get deviceInfo => DeviceInfoPlugin();
}
