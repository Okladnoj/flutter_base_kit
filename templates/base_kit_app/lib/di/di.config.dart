// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:device_info_plus/device_info_plus.dart' as _i833;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:package_info_plus/package_info_plus.dart' as _i655;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../api/dio/dio_api.dart' as _i1023;
import '../api/interceptors/api_interceptors.dart' as _i956;
import '../api/retrofit/example/example_api.dart' as _i1045;
import '../api/retrofit/posts/posts_api.dart' as _i652;
import '../core/example/example_cubit.dart' as _i180;
import '../core/posts/posts_cubit.dart' as _i286;
import '../core/settings/settings_state.dart' as _i751;
import '../core/snack_messages/snack_messages_state.dart' as _i935;
import '../routes/module/route_module.dart' as _i402;
import '../routes/observer/app_observer.dart' as _i694;
import '../routes/router.dart' as _i393;
import '../services/api/example/example_service.dart' as _i229;
import '../services/api/posts/posts_service.dart' as _i354;
import '../services/other/app_info/app_info_service.dart' as _i810;
import '../services/other/url_launcher/url_launcher_service.dart' as _i792;
import '../services/storage/fonts/fonts_service.dart' as _i490;
import '../services/storage/locale/locale_service.dart' as _i247;
import '../services/storage/store_version/store_version_service.dart' as _i395;
import '../services/storage/theme/theme_service.dart' as _i977;
import '../services/storage/token/token_service.dart' as _i700;
import 'modules/di_module.dart' as _i831;

const String _dev = 'dev';

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final diModule = _$DiModule();
  final routeModule = _$RouteModule();
  final dioModule = _$DioModule();
  final postsApiModule = _$PostsApiModule();
  final exampleApiModule = _$ExampleApiModule();
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => diModule.prefs,
    preResolve: true,
  );
  gh.factory<_i558.FlutterSecureStorage>(() => diModule.secureStorage);
  await gh.factoryAsync<_i655.PackageInfo>(
    () => diModule.packageInfo,
    preResolve: true,
  );
  gh.factory<_i833.DeviceInfoPlugin>(() => diModule.deviceInfo);
  gh.factory<_i694.AppObserver>(() => _i694.AppObserver());
  gh.singleton<_i935.SnackMessagesState>(() => _i935.SnackMessagesState());
  gh.lazySingleton<_i393.AppRouter>(() => routeModule.router());
  gh.lazySingleton<_i792.UrlLauncherService>(
      () => const _i792.UrlLauncherService());
  gh.factory<_i395.StoreVersionService>(() => _i395.StoreVersionService(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ));
  gh.factory<_i700.TokenService>(
      () => _i700.TokenService(gh<_i558.FlutterSecureStorage>()));
  gh.factory<_i247.LocaleService>(
      () => _i247.LocaleService(gh<_i460.SharedPreferences>()));
  gh.factory<_i977.ThemeService>(
      () => _i977.ThemeService(gh<_i460.SharedPreferences>()));
  gh.factory<_i490.FontsService>(
      () => _i490.FontsService(gh<_i460.SharedPreferences>()));
  gh.lazySingleton<_i810.AppInfoService>(
    () => _i810.AppInfoServiceDev(gh<_i655.PackageInfo>()),
    registerFor: {_dev},
  );
  gh.singleton<_i751.SettingsState>(() => _i751.SettingsState(
        gh<_i247.LocaleService>(),
        gh<_i977.ThemeService>(),
        gh<_i490.FontsService>(),
      ));
  gh.lazySingleton<_i956.ApiInterceptor>(
      () => _i956.ApiInterceptor(gh<_i700.TokenService>()));
  gh.lazySingleton<_i361.Dio>(
      () => dioModule.client(gh<_i956.ApiInterceptor>()));
  gh.lazySingleton<_i652.PostsApi>(
      () => postsApiModule.getInstance(gh<_i361.Dio>()));
  gh.lazySingleton<_i1045.ExampleApi>(
      () => exampleApiModule.getInstance(gh<_i361.Dio>()));
  gh.lazySingleton<_i229.ExampleService>(
      () => _i229.ExampleService(gh<_i1045.ExampleApi>()));
  gh.lazySingleton<_i354.PostsService>(
      () => _i354.PostsService(gh<_i652.PostsApi>()));
  gh.factory<_i286.PostsCubit>(
      () => _i286.PostsCubit(gh<_i354.PostsService>()));
  gh.factory<_i180.ExampleCubit>(
      () => _i180.ExampleCubit(gh<_i229.ExampleService>()));
  return getIt;
}

class _$DiModule extends _i831.DiModule {}

class _$RouteModule extends _i402.RouteModule {}

class _$DioModule extends _i1023.DioModule {}

class _$PostsApiModule extends _i652.PostsApiModule {}

class _$ExampleApiModule extends _i1045.ExampleApiModule {}
