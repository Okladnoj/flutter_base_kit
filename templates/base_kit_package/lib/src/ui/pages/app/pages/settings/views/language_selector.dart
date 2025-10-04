import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/settings/settings_state.dart';
import '../../../../../../l10n/localization_helper.dart';
import '../../../../../../themes/app_theme.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsState>();
    final currentLocale = settings.locale;

    final normalizedLocale = AppLocalizations.supportedLocales.firstWhere(
      (locale) => locale.languageCode == currentLocale.languageCode,
      orElse: () => AppLocalizations.supportedLocales.first,
    );

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
              const Icon(Icons.language),
              const SizedBox(width: 12),
              Text(
                context.strings.languages,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<Locale>(
            initialValue: normalizedLocale,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: context.designs.primary.withValues(alpha: 0.3),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: context.designs.primary.withValues(alpha: 0.3),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: context.designs.primary,
                  width: 2,
                ),
              ),
              filled: true,
              fillColor: context.designs.surface,
            ),
            items:
                AppLocalizations.supportedLocales.map((locale) {
                  return DropdownMenuItem<Locale>(
                    value: locale,
                    child: Row(
                      children: [
                        Text(
                          getLocaleFlag(locale),
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          getLocaleLocalizations(locale).languageName,
                          style: TextStyle(
                            color: context.designs.textPrimary,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
            onChanged: (Locale? newLocale) {
              if (newLocale != null) {
                settings.changeLanguage(newLocale);
              }
            },
            dropdownColor: context.designs.surface,
            style: TextStyle(color: context.designs.textPrimary, fontSize: 14),
            icon: Icon(
              Icons.arrow_drop_down,
              color: context.designs.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
