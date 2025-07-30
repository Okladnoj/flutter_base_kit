import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/core/core.dart';
import 'app_builder.dart';
import 'app_listener.dart';

@immutable
class AppConsumer<C extends BlocBase<S>, S extends BaseStateI>
    extends StatelessWidget {
  final bool withScaffold;
  final bool withErrorBuilder;
  final bool Function(S state)? withLoadingBuilder;
  final bool Function(S state)? withRefreshBuilder;
  final Widget Function(S state) builder;
  final Widget Function(S state)? buildLoading;
  final Widget Function(S state)? buildRefresh;
  final Widget Function(S state)? buildError;
  final bool Function(S previous, S current)? buildWhen;
  final void Function(BuildContext context, S state)? listenInfo;
  final void Function(BuildContext context, S state)? listenError;
  final void Function(BuildContext context, S state)? listenDefault;
  final bool Function(S previous, S current)? listenWhen;

  const AppConsumer({
    super.key,
    required this.builder,
    this.withScaffold = false,
    this.withErrorBuilder = false,
    this.withLoadingBuilder,
    this.withRefreshBuilder,
    this.buildLoading,
    this.buildRefresh,
    this.buildError,
    this.buildWhen,
    this.listenInfo,
    this.listenError,
    this.listenDefault,
    this.listenWhen,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<C, S>(
      listenWhen: listenWhen,
      listener: (context, state) {
        try {
          appListener(
            context,
            state,
            listenInfo: listenInfo,
            listenError: listenError,
            listenDefault: listenDefault,
          );
        } catch (_) {}
      },
      builder: (context, state) {
        return AppBuilder<C, S>(
          key: key,
          builder: builder,
          withScaffold: withScaffold,
          withErrorBuilder: withErrorBuilder,
          withLoadingBuilder: withLoadingBuilder,
          withRefreshBuilder: withRefreshBuilder,
          buildLoading: buildLoading,
          buildRefresh: buildRefresh,
          buildError: buildError,
          buildWhen: buildWhen,
        );
      },
    );
  }
}
