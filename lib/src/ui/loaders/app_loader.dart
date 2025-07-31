import 'dart:ui';

import 'package:flutter/material.dart';

import '../../themes/colors_set.dart';

/// Global loader widget for the application
///
/// Provides a centralized way to display loading states across the app.
/// The loading widget can be customized globally using [setLoadPreset].
///
/// Usage:
/// ```dart
/// // Set custom loader
/// AppKitLoader.setLoadPreset(CustomLoader());
///
/// // Use in widgets
/// if (isLoading) {
///   return AppKitLoader();
/// }
/// ```
class AppKitLoader extends StatelessWidget {
  const AppKitLoader({super.key});

  static Widget _loadPreset = const SizedBox.shrink();

  /// Sets the global loading widget preset
  ///
  /// [preset] - The widget to display during loading states
  static void setLoadPreset(Widget preset) {
    _loadPreset = preset;
  }

  @override
  Widget build(BuildContext context) {
    return _loadPreset;
  }
}

/// Default loading widget with blur effect and circular progress
///
/// Provides a beautiful loading indicator with:
/// - Blur backdrop filter
/// - Semi-transparent background
/// - Circular progress indicator
/// - Customizable size and appearance
///
/// Usage:
/// ```dart
/// // Basic usage
/// AppDefaultLoader()
///
/// // Customized
/// AppDefaultLoader(
///   size: 64,
///   withBackground: false,
///   withLottie: false,
/// )
/// ```
class AppDefaultLoader extends StatelessWidget {
  /// Size of the loading indicator
  final double size;

  /// Whether to show the semi-transparent background
  final bool withBackground;

  /// Whether to use Lottie animation (reserved for future use)
  final bool withLottie;

  const AppDefaultLoader({
    super.key,
    this.size = 48,
    this.withBackground = true,
    this.withLottie = true,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(16);
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2,
          sigmaY: 2,
        ),
        blendMode: BlendMode.srcOver,
        child: Container(
          padding: EdgeInsets.all(size * 0.25),
          decoration: withBackground
              ? BoxDecoration(
                  color: ColorsSet.primary.withValues(alpha: 0.4),
                  borderRadius: borderRadius,
                )
              : null,
          child: SizedBox(
            height: size,
            width: size,
            child: CircularProgressIndicator(strokeWidth: size * 0.1),
          ),
        ),
      ),
    );
  }
}
