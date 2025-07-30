import 'package:flutter/material.dart';

class ColorsSetModel {
  final Color primary;
  final Color secondary;
  final Color background;
  final Color text;
  final Color icon;

  final Color colorBackground;
  final Color colorIcon;
  final Color colorWhite;
  final Color colorBlack;
  final Color colorPurple;

  final Color colorSchemeError;
  final Color colorSchemePrimary;

  final Gradient gradient;

  const ColorsSetModel({
    this.primary = const Color(0xFF000000),
    this.secondary = const Color(0xFF000000),
    this.background = const Color(0xFF000000),
    this.text = const Color(0xFF000000),
    this.icon = const Color(0xFF000000),
    this.colorBackground = const Color(0xFFFFFFFF),
    this.colorIcon = const Color(0xFF000000),
    this.colorWhite = const Color(0xFFFFFFFF),
    this.colorBlack = const Color(0xFF000000),
    this.colorPurple = const Color(0xFF9C27B0),
    this.colorSchemeError = const Color(0xFFB00020),
    this.colorSchemePrimary = const Color(0xFF000000),
    this.gradient = const LinearGradient(
      colors: [Color(0xFF000000), Color(0xFF666666)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  });
}
