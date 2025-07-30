import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';
import '../buttons/app_secondary_button.dart';
import 'app_alert_dialog.dart';
import 'app_dialog.dart';

class AppDialog {
  final BuildContext _context;

  const AppDialog._(this._context);

  factory AppDialog.of(BuildContext context) => AppDialog._(context);

  Future<T?> showAlert<T>({
    String title = '',
    String info = '',
    String cancelText = '',
    String acceptText = '',
    ValueSetter<BuildContext>? onCancel,
    ValueSetter<BuildContext>? onAccept,
  }) {
    try {
      final dCtx = _dialogContext;
      if (dCtx != null) {
        Navigator.maybePop(dCtx);
        _dialogContext = null;
      }
    } catch (_) {}

    return showDialog<T>(
      context: _context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (context) {
        _dialogContext = context;
        return AppAlertDialog(
          title: title,
          info: info,
          cancelText: cancelText,
          acceptText: acceptText,
          onCancel: onCancel,
          onAccept: onAccept,
        );
      },
    );
  }

  Future<T?> appDialog<T>({
    EdgeInsetsGeometry padding = const EdgeInsets.all(20),
    VoidCallback? dismissHandel,
    required Widget child,
  }) {
    return showDialog<T>(
      context: _context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (context) {
        return WidgetDialog(
          padding: padding,
          dismissHandel: dismissHandel,
          child: child,
        );
      },
    );
  }

  Future<T?> show<T>({
    required Widget child,
    bool useSafeArea = true,
  }) {
    return showDialog<T>(
      context: _context,
      barrierColor: Colors.transparent,
      useSafeArea: useSafeArea,
      builder: (context) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          child: Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            child: child,
          ),
        );
      },
    );
  }

  Future<bool?> confirmDialog({
    String? title,
    String? content,
    String? cancel,
    String? confirm,
  }) async {
    final confirmed = await showDialog<bool>(
      context: _context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xE51E294A),
          title: title == null
              ? null
              : Text(
                  title,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
          content: content == null
              ? null
              : Text(
                  content,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.designs.background,
                    fontSize: 20,
                  ),
                ),
          actions: [
            if (cancel != null)
              AppSecondaryButton(
                onTap: () => Navigator.pop(context, false),
                width: double.infinity,
                colorText: context.designs.surface,
                fontWeight: FontWeight.w500,
                text: cancel,
              ),
            if (cancel != null) const SizedBox(height: 16),
            if (confirm != null)
              AppSecondaryButton(
                onTap: () => Navigator.pop(context, true),
                width: double.infinity,
                colorText: context.designs.surface,
                fontWeight: FontWeight.w500,
                text: confirm,
              ),
          ],
        );
      },
    );
    return confirmed;
  }

  static BuildContext? _dialogContext;
}
