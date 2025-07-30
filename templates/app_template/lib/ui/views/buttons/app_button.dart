import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;

  const AppButton({
    super.key,
    required this.onTap,
    required this.child,
    this.borderRadius,
  });

  BorderRadius? get _borderRadius {
    if (borderRadius != null) return borderRadius;

    return BorderRadius.circular(4);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: _borderRadius,
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
