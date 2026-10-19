import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../gen/assets.gen.dart';
import 'dao/example/example_dao.dart';
import 'tables/example/example_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [ExampleTable], daos: [ExampleDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  factory AppDatabase.open() {
    return AppDatabase(
      driftDatabase(
        name: _databaseName,
        web: DriftWebOptions(
          sqlite3Wasm: Uri.parse('sqlite3.wasm'),
          driftWorker: Uri.parse('drift_worker.js'),
        ),
      ),
    );
  }

  static const _databaseName = '${Assets.package}_db';

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(onCreate: (m) => m.createAll());
  }
}
