import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/settings/settings_state.dart';
import 'core/snack_messages/snack_messages_view.dart';
import 'di/di.dart';
import 'l10n/localization_helper.dart';
import 'routes/observer/app_observer.dart';
import 'routes/router.dart';
import 'services/storage/token/token_service.dart';

class AppExample extends StatelessWidget {
  final AppRouter router;

  const AppExample({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SettingsState>();
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.linear(state.textScaleFactor),
      ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        locale: state.locale,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: state.themeType.themeData(fontFamily: state.fontFamily),
        routerConfig: router.config(
          navigatorObservers: () => [AppObserver()],
          deepLinkBuilder: (deepLink) async {
            final token = await locator<TokenService>().getToken();

            if (token.isNotEmpty) {
              return const DeepLink([SplashRoute()]);
            }

            return const DeepLink([AppFlowRoute()]);
          },
        ),
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(child: child),
              const SnackMessagesView(),
            ],
          );
        },
      ),
    );
  }
}
