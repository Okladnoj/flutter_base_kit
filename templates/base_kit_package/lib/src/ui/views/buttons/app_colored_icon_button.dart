import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../themes/app_theme.dart';
import 'app_button.dart';

class AppColoredIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String iconPath;
  final String text;
  final Color color;

  const AppColoredIconButton({
    super.key,
    required this.onTap,
    required this.iconPath,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(26, 15, 26, 15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconPath),
            const SizedBox(width: 34),
            Text(
              text,
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium?.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: context.designs.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
