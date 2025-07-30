import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppObserver extends AutoRouterObserver {
  AppObserver();

  @override
  void didPush(Route route, Route? previousRoute) {
    _logNavigation(previousRoute, route);

    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _logNavigation(previousRoute, route, isBackNavigation: true);

    super.didPop(route, previousRoute);
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    _logTab(previousRoute, route);
    super.didInitTabRoute(route, previousRoute);
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    _logTab(previousRoute, route);
    super.didChangeTabRoute(route, previousRoute);
  }

  void _logNavigation(
    Route<dynamic>? previousRoute,
    Route<dynamic> route, {
    bool isBackNavigation = false,
  }) {
    String arrow = isBackNavigation ? '<--=' : '=-->';
    String destination = route.settings.name ?? 'Unknown';

    if (previousRoute == null) {
      log('✓ $arrow $destination');
    } else {
      String origin = previousRoute.settings.name ?? 'Unknown';
      log('✓ $origin $arrow $destination');
    }
  }

  void _logTab(
    TabPageRoute? previousRoute,
    TabPageRoute route, {
    bool isBackNavigation = false,
  }) {
    String arrow = isBackNavigation ? '<--=' : 'tab';
    String destination = route.name;

    if (previousRoute == null) {
      log('✓ $arrow $destination');
    } else {
      String origin = previousRoute.name;
      log('✓ $origin $arrow $destination');
    }
  }
}
