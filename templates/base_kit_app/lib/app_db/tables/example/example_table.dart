import 'package:drift/drift.dart';

class ExampleTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
