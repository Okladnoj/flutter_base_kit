import 'package:flutter_base_kit/flutter_base_kit.dart';
import 'package:injectable/injectable.dart';

import '../../../app_db/dao/example/example_dao.dart';
import '../../../models/example/example_model.dart';

@lazySingleton
class ExampleDbService extends BaseService {
  final ExampleDao _dao;

  const ExampleDbService(
    this._dao,
  );

  Future<List<ExampleModel>> getAll() async {
    return errorParser(_dao.getAll);
  }

  Stream<List<ExampleModel>> watchAll() {
    return _dao.watchAll();
  }

  Future<void> saveAll(List<ExampleModel> values) async {
    return errorParser(() async {
      await _dao.saveAll(values);
    });
  }

  Future<void> deleteAll() async {
    return errorParser(_dao.deleteAll);
  }
}
