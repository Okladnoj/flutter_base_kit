import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_base_kit/flutter_base_kit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await KitInitializer.initialize(
    errorHandler: (error) {
      log('errorHandler: $error');
    },
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
