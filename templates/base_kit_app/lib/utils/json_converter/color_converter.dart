import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../extensions/color_extensions.dart';
import '../extensions/string_extensions.dart';

class ColorConverter implements JsonConverter<Color?, String?> {
  const ColorConverter();

  @override
  Color? fromJson(String? hex) {
    if (hex == null) return null;

    return hex.toColor;
  }

  @override
  String? toJson(Color? color) {
    if (color == null) return null;

    return color.toHex;
  }
}
