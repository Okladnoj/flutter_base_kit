import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../models/api/response_wrapper_model.dart';
import '../../../models/example/example_model.dart';
import '../../constants/api_constants.dart';

part 'posts_api.g.dart';

@module
abstract class PostsApiModule {
  @lazySingleton
  PostsApi getInstance(Dio dio) {
    return PostsApi(dio, baseUrl: ApiConstants.baseUrl);
  }
}

@RestApi()
abstract class PostsApi {
  factory PostsApi(Dio dio, {String baseUrl}) = _PostsApi;

  @GET('/posts')
  Future<ResponseWrapperModels<ExampleModel>> getPosts();
}
