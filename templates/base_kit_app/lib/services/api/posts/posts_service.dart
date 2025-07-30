import 'package:flutter_base_kit/flutter_base_kit.dart';
import 'package:injectable/injectable.dart';

import '../../../api/retrofit/posts/posts_api.dart';
import '../../../models/api/response_wrapper_model.dart';
import '../../../models/example/example_model.dart';

@lazySingleton
class PostsService extends BaseService {
  final PostsApi _api;

  const PostsService(
    this._api,
  );

  Future<RWMs<ExampleModel>> getPosts() async {
    return errorParser(() async {
      return _api.getPosts();
    });
  }
}
