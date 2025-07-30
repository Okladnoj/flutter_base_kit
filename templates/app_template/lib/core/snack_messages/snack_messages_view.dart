import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../themes/app_theme.dart';
import 'snack_messages_state.dart';

class SnackMessagesView extends StatelessWidget {
  const SnackMessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    final message = context.select<SnackMessagesState, String?>((state) {
      return state.message;
    });

    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              const Spacer(),
              IgnorePointer(
                ignoring: message == null,
                child: AnimatedOpacity(
                  opacity: message != null ? 1 : 0,
                  duration: Durations.long4,
                  child: _buildSnackCard(context, message),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSnackCard(BuildContext context, String? message) {
    message ??= '';
    final designs = context.designs;
    return Material(
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        padding: const EdgeInsets.fromLTRB(16, 4, 0, 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: designs.primary),
          color: designs.background,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                message,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: designs.surface,
                ),
              ),
            ),
            IconButton(
              onPressed: SnackMessagesState.close,
              icon: Icon(Icons.close, color: designs.primary),
            )
          ],
        ),
      ),
    );
  }
}
