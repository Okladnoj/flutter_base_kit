import 'strings_set_model.dart';

abstract class StringsSet {
  static var _strings = const StringsSetModel();

  static String get somethingWentWrong => _strings.somethingWentWrong;
  static String get ok => _strings.ok;
  static String get selectImageFrom => _strings.selectImageFrom;
  static String get gallery => _strings.gallery;
  static String get camera => _strings.camera;

  static void setStrings(StringsSetModel strings) => _strings = strings;
}
