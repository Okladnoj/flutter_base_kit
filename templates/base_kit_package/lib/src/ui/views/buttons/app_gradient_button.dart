import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';
import '../design/gradient_border.dart';
import 'app_button.dart';

class AppGradientButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final bool isActive;
  final EdgeInsets? padding;
  final double? fontSize;

  const AppGradientButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isActive = true,
    this.padding = const EdgeInsets.fromLTRB(24, 12, 26, 12),
    this.fontSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        padding: padding,
        decoration: BoxDecoration(
          border: GradientBoxBorder(gradient: context.designs.gradientButton),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: context.textTheme.titleMedium?.copyWith(
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
            color: context.designs.onPrimary,
          ),
        ),
      ),
    );
  }
}
