import 'package:flutter_base_kit/flutter_base_kit.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class FontsService extends BaseService {
  static const _themeKey = 'fonts';
  final SharedPreferences _storage;

  const FontsService(this._storage);

  String? getFontFamily() {
    final result = _storage.getString(_themeKey);
    if (result == null) return null;
    return result;
  }

  Future<bool> saveFontFamily(String fontFamily) async {
    return _storage.setString(_themeKey, fontFamily);
  }
}
