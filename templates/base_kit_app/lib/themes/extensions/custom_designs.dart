import 'package:flutter/material.dart';

@immutable
class CustomDesigns extends ThemeExtension<CustomDesigns> {
  final Color primary;
  final Color secondary;
  final Color background;
  final Color surface;
  final Color error;
  final Color onPrimary;
  final Color onSecondary;
  final Color onBackground;
  final Color onSurface;
  final Color onError;
  final Color textPrimary;
  final Color textSecondary;
  final Color textDisabled;
  final LinearGradient gradientButton;
  final LinearGradient gradientInactiveButton;
  final LinearGradient gradientAppBar;

  const CustomDesigns._({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.error,
    required this.onPrimary,
    required this.onSecondary,
    required this.onBackground,
    required this.onSurface,
    required this.onError,
    required this.textPrimary,
    required this.textSecondary,
    required this.textDisabled,
    required this.gradientButton,
    required this.gradientInactiveButton,
    required this.gradientAppBar,
  });

  factory CustomDesigns.light() {
    final base = BaseDesigns.instance;
    return CustomDesigns._(
      primary: base.sunsetPeach,
      secondary: base.spicedBrick,
      background: base.vanillaCream,
      surface: base.sunsetPeach,
      error: base.error,
      onPrimary: base.black,
      onSecondary: base.black,
      onBackground: base.black,
      onSurface: base.abyssBlack,
      onError: base.error,
      textPrimary: base.black,
      textSecondary: base.black.withValues(alpha: 0.7),
      textDisabled: base.black.withValues(alpha: 0.5),
      gradientButton: LinearGradient(
        colors: [base.spicedBrick, base.sunsetPeach],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      gradientInactiveButton: LinearGradient(
        colors: [base.vanillaCream, base.white],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      gradientAppBar: LinearGradient(
        colors: [base.burntMerlot, base.sunsetPeach],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  factory CustomDesigns.dark() {
    final base = BaseDesigns.instance;
    return CustomDesigns._(
      primary: base.burntMerlot,
      secondary: base.sunsetPeach,
      background: base.abyssBlack,
      surface: base.burntMerlot,
      error: base.error,
      onPrimary: base.white,
      onSecondary: base.white,
      onBackground: base.white,
      onSurface: base.vanillaCream,
      onError: base.error,
      textPrimary: base.white,
      textSecondary: base.white.withValues(alpha: 0.7),
      textDisabled: base.white.withValues(alpha: 0.5),
      gradientButton: LinearGradient(
        colors: [base.burntMerlot, base.spicedBrick],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      gradientInactiveButton: LinearGradient(
        colors: [base.white, base.vanillaCream],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      gradientAppBar: LinearGradient(
        colors: [base.burntMerlot, base.abyssBlack],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  @override
  ThemeExtension<CustomDesigns> copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? surface,
    Color? error,
    Color? onPrimary,
    Color? onSecondary,
    Color? onBackground,
    Color? onSurface,
    Color? onError,
    Color? textPrimary,
    Color? textSecondary,
    Color? textDisabled,
    LinearGradient? gradientButton,
    LinearGradient? gradientInactiveButton,
    LinearGradient? gradientAppBar,
  }) {
    return CustomDesigns._(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      error: error ?? this.error,
      onPrimary: onPrimary ?? this.onPrimary,
      onSecondary: onSecondary ?? this.onSecondary,
      onBackground: onBackground ?? this.onBackground,
      onSurface: onSurface ?? this.onSurface,
      onError: onError ?? this.onError,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textDisabled: textDisabled ?? this.textDisabled,
      gradientButton: gradientButton ?? this.gradientButton,
      gradientInactiveButton:
          gradientInactiveButton ?? this.gradientInactiveButton,
      gradientAppBar: gradientAppBar ?? this.gradientAppBar,
    );
  }

  @override
  ThemeExtension<CustomDesigns> lerp(
    covariant ThemeExtension<CustomDesigns>? other,
    double t,
  ) {
    if (other is! CustomDesigns) {
      return this;
    }
    return CustomDesigns._(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      error: Color.lerp(error, other.error, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      gradientButton: gradientButton,
      gradientInactiveButton: gradientInactiveButton,
      gradientAppBar: gradientAppBar,
    );
  }
}

@immutable
class BaseDesigns extends ThemeExtension<BaseDesigns> {
  final Color vanillaCream;
  final Color sunsetPeach;
  final Color spicedBrick;
  final Color burntMerlot;
  final Color abyssBlack;
  final Color error;
  final Color black;
  final Color white;

  const BaseDesigns._({
    required this.vanillaCream,
    required this.sunsetPeach,
    required this.spicedBrick,
    required this.burntMerlot,
    required this.abyssBlack,
    required this.error,
    required this.black,
    required this.white,
  });

  static BaseDesigns get instance {
    return const BaseDesigns._(
      vanillaCream: Color(0xFFFEF4DB),
      sunsetPeach: Color(0xFFF8A86A),
      spicedBrick: Color(0xFFB54213),
      burntMerlot: Color(0xFF4D0C02),
      abyssBlack: Color(0xFF040000),
      error: Color(0xFFB00020),
      black: Color(0xFF000000),
      white: Color(0xFF7F9FAC),
    );
  }

  @override
  ThemeExtension<BaseDesigns> copyWith({
    Color? vanillaCream,
    Color? sunsetPeach,
    Color? spicedBrick,
    Color? burntMerlot,
    Color? abyssBlack,
    Color? error,
    Color? black,
    Color? white,
  }) {
    return BaseDesigns._(
      vanillaCream: vanillaCream ?? this.vanillaCream,
      sunsetPeach: sunsetPeach ?? this.sunsetPeach,
      spicedBrick: spicedBrick ?? this.spicedBrick,
      burntMerlot: burntMerlot ?? this.burntMerlot,
      abyssBlack: abyssBlack ?? this.abyssBlack,
      error: error ?? this.error,
      black: black ?? this.black,
      white: white ?? this.white,
    );
  }

  @override
  ThemeExtension<BaseDesigns> lerp(
    covariant ThemeExtension<BaseDesigns>? other,
    double t,
  ) {
    if (other is! BaseDesigns) {
      return this;
    }
    return BaseDesigns._(
      vanillaCream: Color.lerp(vanillaCream, other.vanillaCream, t)!,
      sunsetPeach: Color.lerp(sunsetPeach, other.sunsetPeach, t)!,
      spicedBrick: Color.lerp(spicedBrick, other.spicedBrick, t)!,
      burntMerlot: Color.lerp(burntMerlot, other.burntMerlot, t)!,
      abyssBlack: Color.lerp(abyssBlack, other.abyssBlack, t)!,
      error: Color.lerp(error, other.error, t)!,
      black: Color.lerp(black, other.black, t)!,
      white: Color.lerp(white, other.white, t)!,
    );
  }
}
