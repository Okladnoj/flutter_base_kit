import 'package:flutter_base_kit/flutter_base_kit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class StoreVersionService extends BaseService {
  static const _localeKey = 'keyStoreVersionService';
  final SharedPreferences _storage;
  final FlutterSecureStorage _secureStorage;

  const StoreVersionService(this._storage, this._secureStorage);

  Future<void> saveVersion(int version) async {
    await _storage.setInt(_localeKey, version);
  }

  int? getVersion() {
    final token = _storage.getInt(_localeKey);

    return token;
  }

  Future<void> clear() async {
    await errorAbsorbParser(_storage.clear);
    await errorAbsorbParser(_secureStorage.deleteAll);
  }
}
