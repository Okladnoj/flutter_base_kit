import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              subtitle: Text('Manage your profile settings'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              subtitle: Text('Configure notification preferences'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.security),
              title: Text('Privacy'),
              subtitle: Text('Privacy and security settings'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              subtitle: Text('Change app language'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text('Theme'),
              subtitle: Text('Light or dark theme'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: context.router.maybePop,
            child: const Text('Back to Example'),
          ),
        ],
      ),
    );
  }
}
