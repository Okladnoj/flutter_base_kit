#include "include/base_kit_package/base_kit_package_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "base_kit_package_plugin.h"

void BaseKitPackagePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  base_kit_package::BaseKitPackagePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
