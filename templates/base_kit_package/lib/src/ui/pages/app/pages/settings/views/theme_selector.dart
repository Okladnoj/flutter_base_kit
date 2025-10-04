import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/settings/settings_state.dart';
import '../../../../../../l10n/localization_helper.dart';
import '../../../../../../themes/app_theme.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SettingsState>();
    final provider = context.read<SettingsState>();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.designs.primary.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.palette),
              const SizedBox(width: 12),
              Text(
                context.strings.theme,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              ThemeOption(
                themeType: ThemeType.light,
                icon: Icons.light_mode,
                color: Colors.orange,
                isSelected: state.themeType == ThemeType.light,
                onTap: provider.changeTheme,
              ),
              const SizedBox(width: 12),
              ThemeOption(
                themeType: ThemeType.dark,
                icon: Icons.dark_mode,
                color: Colors.blue,
                isSelected: state.themeType == ThemeType.dark,
                onTap: provider.changeTheme,
              ),
              const SizedBox(width: 12),
              ThemeOption(
                themeType: ThemeType.system,
                icon: Icons.settings_brightness,
                color: Colors.grey,
                isSelected: state.themeType == ThemeType.system,
                onTap: provider.changeTheme,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ThemeOption extends StatelessWidget {
  final ThemeType themeType;
  final IconData icon;
  final Color color;
  final bool isSelected;
  final ValueChanged<ThemeType> onTap;

  const ThemeOption({
    super.key,
    required this.themeType,
    required this.icon,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(themeType),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color:
                isSelected
                    ? context.designs.primary.withValues(alpha: 0.2)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? context.designs.primary : Colors.transparent,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected ? context.designs.primary : color,
                size: 24,
              ),
              const SizedBox(height: 4),
              Text(
                themeType.getLocalizedName(context),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color:
                      isSelected
                          ? context.designs.primary
                          : context.designs.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
