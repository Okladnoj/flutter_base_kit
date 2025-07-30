import 'package:flutter_base_kit/flutter_base_kit.dart';
import 'package:injectable/injectable.dart';

import '../../../api/retrofit/example/example_api.dart';
import '../../../models/api/response_wrapper_model.dart';
import '../../../models/example/example_model.dart';

@lazySingleton
class ExampleService extends BaseService {
  final ExampleApi _api;

  const ExampleService(this._api);

  Future<ResponseWrapperModels<ExampleModel>> getPosts() async {
    return errorParser(() async {
      return _api.getPosts();
    });
  }
}
