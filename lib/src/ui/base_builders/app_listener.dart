import 'package:flutter/material.dart';

import '../../base/core/core.dart';
import '../../themes/strings_set.dart';
import '../dialogs/show_app_alert_dialog.dart';
import '../snack_bar/show_snack_bar.dart';

void appListener<S extends BaseStateI>(
  BuildContext context,
  S state, {
  void Function(BuildContext context, S state)? listenInfo,
  void Function(BuildContext context, S state)? listenError,
  void Function(BuildContext context, S state)? listenDefault,
}) {
  switch (state.status) {
    case StateStatus.info:
      _onInfo(context, state, listenInfo);
      break;
    case StateStatus.error:
      _onError(context, state, listenError);
      break;
    default:
      listenDefault?.call(context, state);
      break;
  }
}

void _onInfo<S extends BaseStateI>(
  BuildContext context,
  S state,
  void Function(BuildContext context, S state)? callBack,
) {
  if (callBack != null) return callBack(context, state);

  AppSnackBar.of(context).showSuccess(state.message);
}

void _onError<S extends BaseStateI>(
  BuildContext context,
  S state,
  void Function(BuildContext context, S state)? callBack,
) {
  if (callBack != null) return callBack(context, state);

  _showErrorDialog(context, state.message);
}

Future<bool?> _showErrorDialog(BuildContext context, [String? info]) async {
  final result = await AppDialog.of(context).showAlert<bool>(
    info: info ?? StringsSet.somethingWentWrong,
    cancelText: StringsSet.ok,
    onCancel: (context) => Navigator.of(context).maybePop(),
  );

  return result;
}
