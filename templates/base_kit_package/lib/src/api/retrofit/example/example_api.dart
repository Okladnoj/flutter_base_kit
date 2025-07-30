import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../models/api/response_wrapper_model.dart';
import '../../../models/example/example_model.dart';
import '../../constants/api_constants.dart';

part 'example_api.g.dart';

@module
abstract class ExampleApiModule {
  @lazySingleton
  ExampleApi getInstance(Dio dio) {
    return ExampleApi(dio, baseUrl: ApiConstants.baseUrl);
  }
}

@RestApi()
abstract class ExampleApi {
  factory ExampleApi(Dio dio, {String baseUrl}) = _ExampleApi;

  @GET('/posts')
  Future<ResponseWrapperModels<ExampleModel>> getPosts();
}
