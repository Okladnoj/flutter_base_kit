import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../l10n/localization_helper.dart';
import '../../../themes/app_theme.dart';
import '../../../themes/extensions/custom_designs.dart';

@RoutePage()
class AppFlowPage extends StatefulWidget {
  const AppFlowPage({super.key});

  @override
  State<AppFlowPage> createState() => _AppFlowPageState();
}

class _AppFlowPageState extends State<AppFlowPage> {
  AppLocalizations get _strings => context.strings;
  TextTheme get _textTheme => context.textTheme;
  CustomDesigns get _designs => context.designs;
  StackRouter get _router => context.router;

  @override
  Widget build(BuildContext context) {
    _strings;
    _textTheme;
    _designs;
    _router;
    return const AutoRouter();
  }
}
