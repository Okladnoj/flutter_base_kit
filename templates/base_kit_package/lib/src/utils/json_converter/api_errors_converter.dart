import 'package:json_annotation/json_annotation.dart';

class ApiErrorsConverter implements JsonConverter<String, dynamic> {
  const ApiErrorsConverter();

  @override
  String fromJson(dynamic json) {
    if (json is Map) {
      return json.values.join('\n');
    }

    if (json is List) {
      return json.join('\n');
    }
    return json.toString();
  }

  @override
  dynamic toJson(String locationPoint) => [locationPoint];
}
