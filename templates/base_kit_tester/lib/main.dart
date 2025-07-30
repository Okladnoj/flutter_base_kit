import 'dart:async';

import 'package:base_kit_package/base_kit_package.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(() async => runApp(AppLoader.load), AppLoader.handleError);
}
