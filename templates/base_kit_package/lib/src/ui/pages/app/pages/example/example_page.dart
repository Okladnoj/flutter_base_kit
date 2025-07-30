import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../routes/router.dart';
import '../../../../../themes/app_theme.dart';
import '../../../../views/app_bars/empty_title.dart';

@RoutePage()
class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.designs.background,
      appBar: EmptyTitle(
        titleText: 'Example Page',
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.router.push(const SettingsRoute()),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 80, color: Colors.green),
            const SizedBox(height: 20),
            const Text(
              'Example Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'This is the main example page of the app template',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => context.router.push(const SettingsRoute()),
              child: const Text('Go to Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
