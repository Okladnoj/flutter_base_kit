import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';
import '../buttons/app_button.dart';

class AppAlertDialog extends StatelessWidget {
  final String title;
  final String info;
  final String cancelText;
  final String acceptText;
  final ValueSetter<BuildContext>? onCancel;
  final ValueSetter<BuildContext>? onAccept;

  const AppAlertDialog({
    super.key,
    this.title = '',
    this.info = '',
    this.cancelText = '',
    this.acceptText = '',
    this.onCancel,
    this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(24);
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: ClipRRect(
            borderRadius: borderRadius,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 14,
                sigmaY: 14,
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.1),
                  borderRadius: borderRadius,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (title.isNotEmpty) _buildTitle(context),
                    if (title.isNotEmpty) const SizedBox(height: 15),
                    if (info.isNotEmpty) _buildDescription(context),
                    if (info.isNotEmpty) const SizedBox(height: 30),
                    _buttons(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return SelectableText(
      title,
      textAlign: TextAlign.center,
      style: context.textTheme.bodyMedium?.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return SelectableText(
      info,
      textAlign: TextAlign.center,
      style: context.textTheme.bodyMedium?.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _buttons(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Row(
        children: _buildActions(context),
      ),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    final both = onCancel != null && onAccept != null;
    return [
      if (onAccept != null) _buildAcceptButton(context),
      if (both) const SizedBox(width: 16),
      if (onCancel != null) _buildCancelButton(context),
    ];
  }

  Widget _buildCancelButton(BuildContext context) {
    final borderRadius = BorderRadius.circular(50);

    return Expanded(
      child: AppButton(
        onTap: () => onCancel?.call(context),
        borderRadius: borderRadius,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
          ),
          child: SizedBox(
            height: 44,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    cancelText,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAcceptButton(BuildContext context) {
    final borderRadius = BorderRadius.circular(50);
    final designs = context.designs;
    return Expanded(
      child: AppButton(
        onTap: () => onAccept?.call(context),
        borderRadius: borderRadius,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: designs.background,
          ),
          child: SizedBox(
            height: 44,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    acceptText,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
