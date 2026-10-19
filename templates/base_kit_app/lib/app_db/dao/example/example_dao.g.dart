// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_dao.dart';

// ignore_for_file: type=lint
mixin _$ExampleDaoMixin on DatabaseAccessor<AppDatabase> {
  $ExampleTableTable get exampleTable => attachedDatabase.exampleTable;
  ExampleDaoManager get managers => ExampleDaoManager(this);
}

class ExampleDaoManager {
  final _$ExampleDaoMixin _db;
  ExampleDaoManager(this._db);
  $$ExampleTableTableTableManager get exampleTable =>
      $$ExampleTableTableTableManager(_db.attachedDatabase, _db.exampleTable);
}
