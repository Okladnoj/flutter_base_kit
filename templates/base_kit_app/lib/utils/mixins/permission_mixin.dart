import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

mixin PermissionMixin {
  Future<bool> tryOnceRequestPermission(
    Permission permission,
    AsyncValueGetter<bool> openSettingsHandler,
  ) async {
    final status = await permission.status;

    if (status.isPermanentlyDenied) {
      if (await openSettingsHandler()) await openSettings();
      return false;
    }

    if (status.isGranted) return true;

    final requestResult = await permission.request();

    if (requestResult.isGranted) return true;

    return false;
  }

  Future<bool> tryRequestPermission(Permission permission) async {
    final status = await permission.status;

    if (status.isGranted) return true;

    final requestResult = await permission.request();

    if (requestResult.isGranted) return true;
    if (requestResult.isPermanentlyDenied) {
      await openSettings();
      return false;
    }

    return false;
  }

  Future<bool> tryRequestPermissions(List<Permission> permissions) async {
    for (final permission in permissions) {
      final granted = await tryRequestPermission(permission);
      if (!granted) return false;
    }

    return true;
  }
}

Future<bool> openSettings() async {
  if (await openAppSettings()) return true;
  await Future.delayed(Durations.extralong4);
  return await openSettings();
}
