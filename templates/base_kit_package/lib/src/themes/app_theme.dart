import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../l10n/localization_helper.dart';
import 'extensions/custom_designs.dart';

part 'dark/dark_theme_data.dart';
part 'light/light_theme_data.dart';

enum ThemeType {
  light,
  dark,
  system;

  static final themeDataMap = {
    ThemeType.dark: _darkThemeData,
    ThemeType.light: _lightThemeData,
  };

  String getLocalizedName(BuildContext context) {
    final themeToNameMap = {
      ThemeType.light: context.strings.light,
      ThemeType.dark: context.strings.dark,
      ThemeType.system: context.strings.system,
    };
    return themeToNameMap[this]!;
  }

  static final labelToEnumMap = {
    ThemeType.dark.name: ThemeType.dark,
    ThemeType.light.name: ThemeType.light,
    ThemeType.system.name: ThemeType.system,
  };

  static ThemeType fromString(String text) {
    return labelToEnumMap[text] ?? ThemeType.light;
  }

  ThemeData themeData({String? fontFamily}) {
    if (this == ThemeType.system) {
      final themeType = switch (_brightness) {
        Brightness.light => ThemeType.light,
        Brightness.dark => ThemeType.dark,
      };
      return themeDataMap[themeType]!(fontFamily: fontFamily);
    }
    return themeDataMap[this]!(fontFamily: fontFamily);
  }

  AssetGenImage get imageBg => switch (this) {
    light => Assets.images.backgroundLight,
    dark => Assets.images.backgroundDark,
    system => switch (_brightness) {
      Brightness.light => Assets.images.backgroundLight,
      Brightness.dark => Assets.images.backgroundDark,
    },
  };

  Brightness get _brightness => PlatformDispatcher.instance.platformBrightness;
}

extension BuildContextExt on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  CustomDesigns get designs => Theme.of(this).extension()!;
  BaseDesigns get baseDesign => Theme.of(this).extension()!;
}
