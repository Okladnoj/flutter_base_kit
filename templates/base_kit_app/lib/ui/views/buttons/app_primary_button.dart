import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';
import 'app_button.dart';

class AppPrimaryButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final bool isActive;
  final EdgeInsets? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? width;

  const AppPrimaryButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isActive = true,
    this.padding,
    this.fontSize,
    this.fontWeight,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: isActive ? onTap : () {},
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: width,
        padding: padding ?? const EdgeInsets.fromLTRB(24, 12, 26, 12),
        decoration: BoxDecoration(
          gradient: isActive
              ? context.designs.gradientButton
              : context.designs.gradientInactiveButton,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: context.textTheme.titleMedium?.copyWith(
            fontSize: fontSize ?? 17,
            fontWeight: fontWeight ?? FontWeight.w700,
            color: isActive
                ? context.designs.onPrimary
                : context.designs.textDisabled,
          ),
        ),
      ),
    );
  }
}
