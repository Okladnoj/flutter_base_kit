import 'dart:ui';

import 'package:flutter/material.dart';

class BlurFilter extends StatelessWidget {
  final Widget child;
  final BorderRadius borderRadius;
  final double sigma;

  const BlurFilter({
    super.key,
    required this.child,
    this.borderRadius = BorderRadius.zero,
    this.sigma = 7,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: child,
      ),
    );
  }
}
