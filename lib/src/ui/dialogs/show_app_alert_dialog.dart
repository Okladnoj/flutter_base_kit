import 'package:flutter/material.dart';

import '../../themes/colors_set.dart';

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
        return _buildAlertDialog(
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
        return _buildWidgetDialog(
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
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                ),
          content: content == null
              ? null
              : Text(
                  content,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ColorsSet.colorBlack,
                        fontSize: 20,
                      ),
                ),
          actions: [
            if (cancel != null)
              _buildSecondaryButton(
                onTap: () => Navigator.pop(context, false),
                text: cancel,
              ),
            if (cancel != null) const SizedBox(height: 16),
            if (confirm != null)
              _buildSecondaryButton(
                onTap: () => Navigator.pop(context, true),
                text: confirm,
              ),
          ],
        );
      },
    );
    return confirmed;
  }

  Widget _buildAlertDialog({
    required String title,
    required String info,
    required String cancelText,
    required String acceptText,
    required ValueSetter<BuildContext>? onCancel,
    required ValueSetter<BuildContext>? onAccept,
  }) {
    return AlertDialog(
      title: Text(title),
      content: Text(info),
      actions: [
        if (onCancel != null)
          TextButton(
            onPressed: () => onCancel(_context),
            child: Text(cancelText),
          ),
        if (onAccept != null)
          TextButton(
            onPressed: () => onAccept(_context),
            child: Text(acceptText),
          ),
      ],
    );
  }

  Widget _buildWidgetDialog({
    required EdgeInsetsGeometry padding,
    required VoidCallback? dismissHandel,
    required Widget child,
  }) {
    return GestureDetector(
      onTap: dismissHandel,
      child: Container(
        color: Colors.transparent,
        child: Center(
          child: Padding(
            padding: padding,
            child: Container(
              decoration: BoxDecoration(
                color: ColorsSet.colorBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton({
    required VoidCallback onTap,
    required String text,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ColorsSet.colorWhite),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorsSet.colorWhite,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  static BuildContext? _dialogContext;
}
