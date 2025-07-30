import 'dart:ui';

import 'package:flutter/material.dart';

import '../../themes/colors_set.dart';

class AppKitLoader extends StatelessWidget {
  const AppKitLoader({super.key});

  static Widget _loadPreset = const SizedBox.shrink();

  static void setLoadPreset(Widget preset) {
    _loadPreset = preset;
  }

  @override
  Widget build(BuildContext context) {
    return _loadPreset;
  }
}

class AppDefaultLoader extends StatelessWidget {
  final double size;
  final bool withBackground;
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
