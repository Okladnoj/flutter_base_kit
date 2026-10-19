import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../app_db/app_database.dart';

part 'example_model.freezed.dart';
part 'example_model.g.dart';

@immutable
@Freezed(makeCollectionsUnmodifiable: false)
abstract class ExampleModel with _$ExampleModel {
  const ExampleModel._();

  const factory ExampleModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
  }) = _ExampleModel;

  factory ExampleModel.fromJson(Map<String, dynamic> json) =>
      _$ExampleModelFromJson(json);

  ExampleTableData get toTable {
    return ExampleTableData(
      id: id ?? '',
      name: name,
    );
  }
}

extension ExampleTableDataExt on ExampleTableData {
  ExampleModel get toModel {
    return ExampleModel(
      id: id,
      name: name,
    );
  }
}
