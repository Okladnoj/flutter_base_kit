import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/settings/settings_state.dart';
import '../../../../../themes/app_theme.dart';
import '../../../../views/app_bars/empty_title.dart';
import '../../../../views/buttons/app_primary_button.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyTitle(titleText: 'Settings'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            tileColor: context.designs.primary.withValues(alpha: 0.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            subtitle: const Text('Manage your profile settings'),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          const SizedBox(height: 8),
          ListTile(
            tileColor: context.designs.primary.withValues(alpha: 0.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            subtitle: const Text('Configure notification preferences'),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          const SizedBox(height: 8),
          ListTile(
            tileColor: context.designs.primary.withValues(alpha: 0.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            leading: const Icon(Icons.security),
            title: const Text('Privacy'),
            subtitle: const Text('Privacy and security settings'),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          const SizedBox(height: 8),
          ListTile(
            tileColor: context.designs.primary.withValues(alpha: 0.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            subtitle: const Text('Change app language'),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          const SizedBox(height: 8),
          ListTile(
            onTap: context.read<SettingsState>().switchTheme,
            tileColor: context.designs.primary.withValues(alpha: 0.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            leading: const Icon(Icons.dark_mode),
            title: const Text('Theme'),
            subtitle: const Text('Light or dark theme'),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          const SizedBox(height: 20),
          AppPrimaryButton(
            onTap: context.router.maybePop,
            text: 'Back to Example',
          ),
        ],
      ),
    );
  }
}
