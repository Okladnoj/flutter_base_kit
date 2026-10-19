import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../models/example/example_model.dart';
import '../../app_database.dart';
import '../../tables/example/example_table.dart';

part 'example_dao.g.dart';

@DriftAccessor(tables: [ExampleTable])
@injectable
class ExampleDao extends DatabaseAccessor<AppDatabase> with _$ExampleDaoMixin {
  ExampleDao(super.attachedDatabase);

  Future<List<ExampleModel>> getAll() async {
    final rows = await select(exampleTable).get();
    return rows.map((row) => row.toModel).toList();
  }

  Stream<List<ExampleModel>> watchAll() {
    return select(
      exampleTable,
    ).watch().map((rows) => rows.map((row) => row.toModel).toList());
  }

  Future<void> saveAll(List<ExampleModel> values) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        exampleTable,
        values.map((value) => value.toTable),
      );
    });
  }

  Future<void> deleteAll() async {
    await delete(exampleTable).go();
  }
}
