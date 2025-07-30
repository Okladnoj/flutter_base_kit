import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:universal_io/io.dart';

import 'app_example.dart';
import 'core/providers.dart';
import 'di/di.dart';
import 'models/enums/di_environment.dart';
import 'routes/router.dart';
import 'ui/pages/splash/splash_page.dart';

Future<void> _simulateLoading() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies(DiEnvironment.dev.env);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0x00000000),
      statusBarBrightness: Brightness.light,
    ),
  );
}

abstract class AppLoader {
  const AppLoader._();

  static Widget get load {
    return FutureBuilder(
      future: _simulateLoading(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const SplashScreen();
        }

        return const AppRoot();
      },
    );
  }

  static Future<void> handleError(Object error, StackTrace stack) async {
    log('Uncaught error: $error\n$stack');

    try {
      final dir = await getApplicationSupportDirectory();
      final file = File('${dir.path}/startup_crash.log');
      file.createSync(recursive: true);
      final timestamp = DateTime.now().toIso8601String();
      final content = '[$timestamp] CRASH ON STARTUP:\n$error\n\n$stack\n';
      await file.writeAsString(content, mode: FileMode.writeOnlyAppend);
    } catch (_) {}
  }
}

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  late final _router = locator<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providers,
      child: AppExample(router: _router),
    );
  }
}
