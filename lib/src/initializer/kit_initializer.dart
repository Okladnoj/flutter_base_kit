import 'package:flutter/material.dart';

import '../../flutter_base_kit.dart';
import '../themes/colors_set.dart';
import '../themes/colors_set_model.dart';
import '../themes/strings_set.dart';
import '../themes/strings_set_model.dart';
import '../ui/loaders/app_loader.dart';

abstract class KitInitializer {
  static Future<void> initialize({
    void Function(BaseException)? errorHandler,
    Widget loadPreset = const AppDefaultLoader(),
    ColorsSetModel? colors,
    StringsSetModel? strings,
  }) async {
    if (errorHandler != null) BaseProvider.setErrorHandler(errorHandler);

    AppKitLoader.setLoadPreset(loadPreset);

    if (colors != null) ColorsSet.setColors(colors);
    if (strings != null) StringsSet.setStrings(strings);
  }
}
