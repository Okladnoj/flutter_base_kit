import 'dart:convert';

import 'package:drift/drift.dart';

class ListIntConverter extends TypeConverter<List<int>, String> {
  const ListIntConverter();

  @override
  List<int> fromSql(String fromDb) {
    if (fromDb.isEmpty) {
      return <int>[];
    }

    final List<dynamic> decoded = jsonDecode(fromDb);
    return decoded.cast<int>();
  }

  @override
  String toSql(List<int> value) {
    return jsonEncode(value);
  }
}

class ListIntUniqueConverter extends TypeConverter<List<int>, String> {
  const ListIntUniqueConverter();

  @override
  List<int> fromSql(String fromDb) {
    if (fromDb.isEmpty) {
      return <int>[];
    }

    final List<dynamic> decoded = jsonDecode(fromDb);
    return decoded.cast<int>().toSet().toList();
  }

  @override
  String toSql(List<int> value) {
    return jsonEncode(value.toSet().toList());
  }
}
