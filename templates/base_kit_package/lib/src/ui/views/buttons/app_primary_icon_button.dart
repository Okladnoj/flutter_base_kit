import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../themes/app_theme.dart';
import 'app_button.dart';

class AppPrimaryIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String iconPath;
  final String text;

  const AppPrimaryIconButton({
    super.key,
    required this.onTap,
    required this.iconPath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(24, 12, 26, 12),
        decoration: BoxDecoration(
          gradient: context.designs.gradientButton,
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
