import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';
import 'app_button.dart';

class AppColoredButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final Color color;
  final Color? colorText;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  const AppColoredButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.color,
    this.colorText,
    this.borderRadius,
    this.padding = const EdgeInsets.fromLTRB(7, 7, 7, 7),
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: onTap,
      borderRadius: borderRadius ?? BorderRadius.circular(24),
      child: Container(
        width: double.infinity,
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius ?? BorderRadius.circular(24),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: context.textTheme.titleMedium?.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: colorText ?? context.designs.onPrimary,
          ),
        ),
      ),
    );
  }
}
