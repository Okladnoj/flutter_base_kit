import 'dart:ui';

import 'package:flutter/material.dart';

class BlurContentFilter extends StatelessWidget {
  final Widget child;
  final double sigmaX;
  final double sigmaY;
  final BorderRadius borderRadius;

  const BlurContentFilter({
    super.key,
    required this.child,
    this.sigmaX = 7,
    this.sigmaY = 7,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: borderRadius,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: sigmaX,
              sigmaY: sigmaY,
            ),
            child: child,
          ),
        ),
        child,
      ],
    );
  }
}
