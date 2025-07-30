import 'package:injectable/injectable.dart';

import '../router.dart';

@module
abstract class RouteModule {
  @lazySingleton
  AppRouter router() => AppRouter();
}
