import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../di/di.dart';
import 'example/example_cubit.dart';
import 'posts/posts_cubit.dart';
import 'settings/settings_state.dart';
import 'snack_messages/snack_messages_state.dart';

abstract class Providers {
  static List<SingleChildWidget> get providers {
    return [
      ChangeNotifierProvider<SettingsState>(create: (_) => locator()..init()),
      ChangeNotifierProvider<SnackMessagesState>(create: (_) => locator()),
      BlocProvider<ExampleCubit>(create: (_) => locator()),
      BlocProvider<PostsCubit>(create: (_) => locator()),
    ];
  }
}
