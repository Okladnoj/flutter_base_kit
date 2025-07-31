class ReadmeTemplates {
  static String appReadme(String name) => '''
# $name

A Flutter application generated with **Flutter Base Kit**.

## Getting Started

```bash
flutter pub get
flutter packages pub run build_runner build
flutter run
```
''';

  static String packageReadme(String name) => '''
# $name

A Flutter package generated with **Flutter Base Kit**.

## Getting Started

```bash
flutter pub get
flutter packages pub run build_runner build
flutter test
```
''';

  static String testerReadme(String tester, String package) => '''
# $tester

A tester app for **$package** generated with **Flutter Base Kit**.

## Getting Started

```bash
flutter pub get
flutter run
```
''';

  static String rootReadme(String repo, String package, String tester) => '''
# $repo

Monorepo generated with **Flutter Base Kit**.

```
$repo/
├── $package/
└── $tester/
```

## Getting Started

```bash
cd $package
flutter pub get
flutter test

cd ../$tester
flutter pub get
flutter run
```
''';
}
