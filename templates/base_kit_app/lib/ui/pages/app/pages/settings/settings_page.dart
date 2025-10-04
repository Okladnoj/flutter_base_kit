import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../l10n/localization_helper.dart';
import '../../../../views/app_bars/empty_title.dart';
import 'views/language_selector.dart';
import 'views/theme_selector.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyTitle(titleText: context.strings.settings),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const LanguageSelector(),
          const SizedBox(height: 8),
          const ThemeSelector(),
        ],
      ),
    );
  }
}
