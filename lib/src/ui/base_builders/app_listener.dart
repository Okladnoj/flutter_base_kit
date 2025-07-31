import 'package:flutter/material.dart';

import '../../base/core/core.dart';
import '../../themes/strings_set.dart';
import '../dialogs/show_app_alert_dialog.dart';
import '../snack_bar/show_snack_bar.dart';

/// Global state listener for handling app-wide state changes
///
/// Automatically handles different state statuses and provides
/// appropriate UI feedback (snackbars, dialogs, etc.).
///
/// Features:
/// - Automatic info state handling with snackbar
/// - Automatic error state handling with dialog
/// - Customizable callbacks for each state type
/// - Default fallback handling
///
/// Usage:
/// ```dart
/// BlocListener<MyBloc, MyState>(
///   listener: (context, state) {
///     appListener(
///       context,
///       state,
///       listenInfo: (context, state) {
///         // Custom info handling
///       },
///       listenError: (context, state) {
///         // Custom error handling
///       },
///     );
///   },
///   child: MyWidget(),
/// )
/// ```
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

/// Handles info state with custom callback or default snackbar
///
/// [context] - Build context
/// [state] - Current state
/// [callBack] - Optional custom callback for info handling
void _onInfo<S extends BaseStateI>(
  BuildContext context,
  S state,
  void Function(BuildContext context, S state)? callBack,
) {
  if (callBack != null) return callBack(context, state);

  AppSnackBar.of(context).showSuccess(state.message);
}

/// Handles error state with custom callback or default dialog
///
/// [context] - Build context
/// [state] - Current state
/// [callBack] - Optional custom callback for error handling
void _onError<S extends BaseStateI>(
  BuildContext context,
  S state,
  void Function(BuildContext context, S state)? callBack,
) {
  if (callBack != null) return callBack(context, state);

  _showErrorDialog(context, state.message);
}

/// Shows error dialog with the provided message
///
/// [context] - Build context
/// [info] - Error message to display
///
/// Returns the dialog result
Future<bool?> _showErrorDialog(BuildContext context, [String? info]) async {
  final result = await AppDialog.of(context).showAlert<bool>(
    info: info ?? StringsSet.somethingWentWrong,
    cancelText: StringsSet.ok,
    onCancel: (context) => Navigator.pop(context),
  );

  return result;
}
