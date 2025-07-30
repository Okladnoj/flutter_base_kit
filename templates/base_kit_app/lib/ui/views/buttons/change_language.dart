import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/settings/settings_state.dart';
import '../../../l10n/localization_helper.dart';

class ChangeLanguage extends StatelessWidget {
  final bool hideRelease;

  const ChangeLanguage({
    super.key,
    this.hideRelease = true,
  });

  void _changeLanguage(BuildContext context, Locale locale) {
    try {
      final cubit = context.read<SettingsState>();
      cubit.changeLanguage(locale);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    if (hideRelease && !kDebugMode) return const SizedBox.shrink();

    final cubit = context.watch<SettingsState>();

    final currentLocale = cubit.locale;

    return PopupMenuButton<Locale>(
      initialValue: currentLocale,
      icon: Icon(
        Icons.g_translate,
        size: 30,
        color: Theme.of(context).colorScheme.primary,
      ),
      onSelected: (locale) => _changeLanguage(context, locale),
      itemBuilder: (_) => AppLocalizations.supportedLocales.map((locale) {
        return PopupMenuItem<Locale>(
          value: locale,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(locale.flag),
              const SizedBox(width: 4),
              Text(locale.name),
            ],
          ),
        );
      }).toList(),
    );
  }
}
