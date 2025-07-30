import 'package:flutter/material.dart';

import 'colors_set_model.dart';

abstract class ColorsSet {
  static var _colors = const ColorsSetModel();

  static Color get primary => _colors.primary;
  static Color get secondary => _colors.secondary;
  static Color get background => _colors.background;
  static Color get text => _colors.text;
  static Color get icon => _colors.icon;

  static Color get colorBackground => _colors.colorBackground;
  static Color get colorIcon => _colors.colorIcon;
  static Color get colorWhite => _colors.colorWhite;
  static Color get colorBlack => _colors.colorBlack;
  static Color get colorPurple => _colors.colorPurple;

  static Color get colorSchemeError => _colors.colorSchemeError;
  static Color get colorSchemePrimary => _colors.colorSchemePrimary;

  static Gradient get gradient => _colors.gradient;

  static void setColors(ColorsSetModel colors) => _colors = colors;
}
