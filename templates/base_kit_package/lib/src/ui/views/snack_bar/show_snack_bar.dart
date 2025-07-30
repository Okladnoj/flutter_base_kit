import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';

class AppSnackBar {
  final BuildContext context;
  final double bottom;

  AppSnackBar.of(this.context, {this.bottom = 4});

  Color _messageTextColor([bool error = false]) {
    return error ? context.colorScheme.error : context.designs.background;
  }

  void showError(String message) => _showAlertSnackBar(message, true);

  void showSuccess(String message) => _showAlertSnackBar(message, false);

  void showInfo(String message) => _showSnackBar(message);

  void _showAlertSnackBar(String message, bool error) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(_buildSnackBar(_buildContentByAlerts(error, message)));
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(_buildSnackBar(_buildContent(message)));
  }

  SnackBar _buildSnackBar(Widget content) {
    return SnackBar(
      elevation: 0,
      margin: EdgeInsets.fromLTRB(28, 0, 28, bottom),
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      content: content,
    );
  }

  Widget _buildContentByAlerts(bool error, String message) {
    return Container(
      decoration: BoxDecoration(
        gradient: _gradient(context),
        borderRadius: _borderRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Row(
          children: [
            _buildIcon(error),
            const SizedBox(width: 8),
            Expanded(child: _buildMessage(message, error)),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(bool error) {
    if (error) {
      return Icon(Icons.error, color: context.colorScheme.error);
    }

    return Icon(Icons.info_outline, color: context.designs.primary);
  }

  Widget _buildMessage(String message, bool error) {
    return Text(
      message,
      style: context.textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w500,
        color: _messageTextColor(error),
      ),
    );
  }

  Widget _buildContent(String message) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: _gradient(context),
        borderRadius: _borderRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          message,
          style: context.textTheme.bodyLarge?.copyWith(
            fontSize: 13,
            letterSpacing: -0.08,
            fontWeight: FontWeight.w400,
            color: context.colorScheme.primary,
          ),
        ),
      ),
    );
  }

  Gradient _gradient(BuildContext context) {
    return context.designs.gradientButton;
  }

  BorderRadiusGeometry? get _borderRadius => BorderRadius.circular(50);
}
