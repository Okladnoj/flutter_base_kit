import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_base_kit/flutter_base_kit.dart';

import '../../../../../../core/logs/logs_state.dart';
import '../../../../../../l10n/localization_helper.dart';
import '../../../../../../themes/app_theme.dart';

class AppLogsViewer extends StatefulWidget {
  const AppLogsViewer({super.key});

  @override
  State<AppLogsViewer> createState() => _AppLogsViewerState();
}

class _AppLogsViewerState extends State<AppLogsViewer> {
  bool _isExpanded = false;
  final _verticalController = ScrollController();
  final _horizontalController = ScrollController();

  @override
  void dispose() {
    _verticalController.dispose();
    _horizontalController.dispose();
    super.dispose();
  }

  Future<void> _shareLogs() async {
    await LogsState.instance.shareLogs(
      onSuccess: _onShareSuccess,
      onError: _onError,
      subject: 'App Logs',
    );
  }

  void _onShareSuccess() {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.strings.logsExported),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _onError() {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.strings.oops),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> _clearLogs() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(context.strings.clearLogs),
            content: Text(context.strings.confirmClearAppLogs),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(context.strings.cancel),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(context.strings.confirm),
              ),
            ],
          ),
    );

    if (confirmed == true) {
      await LogsState.instance.clear(
        onSuccess: _onClearSuccess,
        onError: _onError,
      );
    }
  }

  void _onClearSuccess() {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.strings.logsCleared),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LogsState>();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.designs.primary.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.article),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  context.strings.appLogs,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (state.hasLogs) ...[
                IconButton(
                  icon: const Icon(Icons.share, size: 20),
                  onPressed: _shareLogs,
                  tooltip: context.strings.exportLogs,
                ),
                IconButton(
                  icon: const Icon(Icons.delete, size: 20),
                  onPressed: _clearLogs,
                  tooltip: context.strings.clearLogs,
                ),
              ],
              IconButton(
                icon: Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  size: 24,
                ),
                onPressed: () {
                  setState(() => _isExpanded = !_isExpanded);
                  if (_isExpanded && !state.hasLogs) {
                    LogsState.instance.loadLogs();
                  }
                },
              ),
            ],
          ),
          if (_isExpanded) ...[
            const SizedBox(height: 16),
            if (!state.hasLogs)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: context.designs.surface,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  context.strings.noAppLogsFound,
                  style: TextStyle(
                    color: context.designs.textPrimary.withValues(alpha: 0.6),
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            else
              Container(
                constraints: const BoxConstraints(maxHeight: 300),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: context.designs.surface,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: context.designs.primary.withValues(alpha: 0.3),
                  ),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final maxW = constraints.maxWidth;
                    final maxWLimit = 1000.0;
                    return Scrollbar(
                      controller: _horizontalController,
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        controller: _horizontalController,
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: min(maxW, maxWLimit),
                            maxWidth: maxWLimit,
                          ),
                          child: Scrollbar(
                            controller: _verticalController,
                            thumbVisibility: true,
                            child: ListView(
                              shrinkWrap: true,
                              controller: _verticalController,
                              children: [
                                ...state.logsContent
                                    .split('\n')
                                    .map(
                                      (log) => RichText(
                                        maxLines: 1,
                                        overflow: TextOverflow.visible,
                                        text: TextSpan(
                                          children: AnsiParser.parseAnsi(
                                            log,
                                            TextStyle(
                                              color:
                                                  context.designs.textPrimary,
                                              fontSize: 12,
                                              fontFamily: 'monospace',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                const SizedBox(height: 50),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ],
      ),
    );
  }
}
