import 'package:injectable/injectable.dart';

enum DiEnvironment {
  dev._(Environment(Environment.dev)),
  test._(Environment(Environment.test));

  final Environment env;

  const DiEnvironment._(this.env);
}
