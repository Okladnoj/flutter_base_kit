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
      primary: base.primary,
      secondary: base.secondary,
      background: base.background,
      surface: base.surface,
      error: base.error,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: base.dark,
      onSurface: base.dark,
      onError: Colors.white,
      textPrimary: base.dark,
      textSecondary: base.dark.withValues(alpha: 0.7),
      textDisabled: base.dark.withValues(alpha: 0.5),
      gradientButton: LinearGradient(
        colors: [base.primary, base.secondary],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      gradientInactiveButton: LinearGradient(
        colors: [base.background, base.background],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      gradientAppBar: LinearGradient(
        colors: [base.primary, base.secondary],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }

  factory CustomDesigns.dark() {
    final base = BaseDesigns.instance;
    return CustomDesigns._(
      primary: base.primary,
      secondary: base.secondary,
      background: base.background,
      surface: base.surface,
      error: base.error,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: base.light,
      onSurface: base.light,
      onError: Colors.white,
      textPrimary: base.light,
      textSecondary: base.light.withValues(alpha: 0.7),
      textDisabled: base.light.withValues(alpha: 0.5),
      gradientButton: LinearGradient(
        colors: [base.primary, base.secondary],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      gradientInactiveButton: LinearGradient(
        colors: [base.background, base.background],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      gradientAppBar: LinearGradient(
        colors: [base.primary, base.secondary],
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
  final Color primary;
  final Color secondary;
  final Color background;
  final Color surface;
  final Color error;
  final Color dark;
  final Color light;

  const BaseDesigns._({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.error,
    required this.dark,
    required this.light,
  });

  static BaseDesigns get instance {
    return const BaseDesigns._(
      primary: Color(0xFF2196F3),
      secondary: Color(0xFF03DAC6),
      background: Color(0xFF555555),
      surface: Color(0xFF7F9FAC),
      error: Color(0xFFB00020),
      dark: Color(0xFF2B3E46),
      light: Color(0xFF7F9FAC),
    );
  }

  @override
  ThemeExtension<BaseDesigns> copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? surface,
    Color? error,
    Color? dark,
    Color? light,
  }) {
    return BaseDesigns._(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      error: error ?? this.error,
      dark: dark ?? this.dark,
      light: light ?? this.light,
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
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      error: Color.lerp(error, other.error, t)!,
      dark: Color.lerp(dark, other.dark, t)!,
      light: Color.lerp(light, other.light, t)!,
    );
  }
}
