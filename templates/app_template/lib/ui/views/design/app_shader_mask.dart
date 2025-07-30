import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';

class AppShaderMask extends StatelessWidget {
  final Widget child;
  final double bottomHeight;

  const AppShaderMask({
    super.key,
    this.bottomHeight = 24,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [context.colorScheme.primary, Colors.transparent],
            stops: const [0.2, 1]).createShader(
          Rect.fromLTRB(0, 0, rect.width, bottomHeight),
        );
      },
      blendMode: BlendMode.dstIn,
      child: child,
    );
  }
}
