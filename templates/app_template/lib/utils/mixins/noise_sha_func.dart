import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

mixin NoiseShaFunc {
  static const _charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    final random = Random.secure();
    return List.generate(
      length,
      (_) => _charset[random.nextInt(_charset.length)],
    ).join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
