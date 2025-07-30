import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_base_kit/generator/constants.dart';

void main() {
  group('Constants', () {
    test('should have valid template names', () {
      expect(Constants.appTemplate, equals('app'));
      expect(Constants.packageTemplate, equals('package'));
      expect(Constants.packageWithTesterTemplate, equals('package+tester'));
    });

    test('should have valid template directory names', () {
      expect(Constants.baseKitAppTemplate, equals('base_kit_app'));
      expect(Constants.baseKitPackageTemplate, equals('base_kit_package'));
      expect(Constants.baseKitTesterTemplate, equals('base_kit_tester'));
    });

    test('should have valid file names', () {
      expect(Constants.pubspecFileName, equals('pubspec.yaml'));
      expect(Constants.flutterBaseKitPackage, equals('flutter_base_kit'));
    });

    test('should have valid message constants', () {
      expect(Constants.createMessage, isNotEmpty);
      expect(Constants.updateMessage, isNotEmpty);
      expect(Constants.successMessage, isNotEmpty);
      expect(Constants.errorMessage, isNotEmpty);
      expect(Constants.infoMessage, isNotEmpty);
      expect(Constants.fileMessage, isNotEmpty);
    });
  });
}
