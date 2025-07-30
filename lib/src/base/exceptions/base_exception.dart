class BaseException implements Exception {
  final String message;

  const BaseException({this.message = ''});

  @override
  String toString() => 'App Exception\n$message';
}
