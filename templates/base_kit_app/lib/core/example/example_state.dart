part of 'example_cubit.dart';

@freezed
abstract class ExampleState extends BaseStateI with _$ExampleState {
  const ExampleState._();

  const factory ExampleState({
    @Default(StateStatus.initial) StateStatus status,
    @Default('') String message,
    @Default([]) List<ExampleModel> posts,
  }) = _ExampleState;
}
