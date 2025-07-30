import 'package:flutter_base_kit/flutter_base_kit.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

abstract class AppInfoService extends BaseService {
  const AppInfoService();

  String? get buildNumber;
  String? get version;
}

@LazySingleton(as: AppInfoService, env: [Environment.dev])
class AppInfoServiceDev extends AppInfoService {
  final PackageInfo _packageInfo;

  const AppInfoServiceDev(this._packageInfo);

  @override
  String? get buildNumber {
    try {
      return _packageInfo.buildNumber;
    } catch (_) {
      return null;
    }
  }

  @override
  String? get version {
    try {
      _packageInfo.data;
      return _packageInfo.version;
    } catch (_) {
      return null;
    }
  }
}
