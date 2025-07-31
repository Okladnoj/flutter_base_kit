import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/pages/app/app_flow_page.dart';
import '../ui/pages/app/pages/example/example_page.dart';
import '../ui/pages/app/pages/settings/settings_page.dart';
import '../ui/pages/splash/splash_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|View|Tab|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.custom(
        transitionsBuilder: TransitionsBuilders.slideRightWithFade,
        duration: const Duration(milliseconds: 300),
        reverseDuration: const Duration(milliseconds: 300),
        barrierColor: Colors.transparent,
      );

  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(page: SplashRoute.page, path: '/'),
      AutoRoute(page: AppFlowRoute.page, children: [
        AutoRoute(page: ExampleRoute.page, path: ''),
        AutoRoute(page: SettingsRoute.page),
      ]),
    ];
  }
}
