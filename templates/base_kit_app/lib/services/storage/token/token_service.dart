import 'package:flutter_base_kit/flutter_base_kit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class TokenService extends BaseService {
  final FlutterSecureStorage _storage;

  const TokenService(this._storage);

  Future<void> saveToken(String token) async {
    await _storage.write(key: _keyAccessToken, value: token);
  }

  Future<String> getToken() async {
    final token = await _storage.read(key: _keyAccessToken);

    return token ?? '';
  }

  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _keyRefreshToken, value: token);
  }

  Future<String> getRefreshToken() async {
    final token = await _storage.read(key: _keyRefreshToken);

    return token ?? '';
  }

  Future<void> clear() async {
    await _storage.delete(key: _keyAccessToken);
    await _storage.delete(key: _keyRefreshToken);
  }

  static const _keyAccessToken = 'keyStorageAccessToken';
  static const _keyRefreshToken = 'keyStorageRefreshToken';
}
