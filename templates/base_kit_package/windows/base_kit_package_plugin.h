#ifndef FLUTTER_PLUGIN_BASE_KIT_PACKAGE_PLUGIN_H_
#define FLUTTER_PLUGIN_BASE_KIT_PACKAGE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace base_kit_package {

class BaseKitPackagePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  BaseKitPackagePlugin();

  virtual ~BaseKitPackagePlugin();

  // Disallow copy and assign.
  BaseKitPackagePlugin(const BaseKitPackagePlugin&) = delete;
  BaseKitPackagePlugin& operator=(const BaseKitPackagePlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace base_kit_package

#endif  // FLUTTER_PLUGIN_BASE_KIT_PACKAGE_PLUGIN_H_
