import 'dart:math';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:universal_io/io.dart';

import '../../../../../../l10n/localization_helper.dart';
import '../../../../../../themes/app_theme.dart';

class CrashLogsViewer extends StatefulWidget {
  const CrashLogsViewer({super.key});

  @override
  State<CrashLogsViewer> createState() => _CrashLogsViewerState();
}

class _CrashLogsViewerState extends State<CrashLogsViewer> {
  bool _isExpanded = false;
  String? _logsContent;
  bool _isLoading = false;
  final _verticalController = ScrollController();
  final _horizontalController = ScrollController();

  @override
  void dispose() {
    _verticalController.dispose();
    _horizontalController.dispose();
    super.dispose();
  }

  Future<void> _loadLogs() async {
    setState(() => _isLoading = true);
    try {
      final dir = await getApplicationSupportDirectory();
      final file = File('${dir.path}/startup_crash.log');
      if (await file.exists()) {
        final content = await file.readAsString();
        setState(() {
          _logsContent = content.isNotEmpty ? content : null;
          _isExpanded = true;
        });
      } else {
        setState(() => _logsContent = null);
      }
    } catch (e) {
      setState(() => _logsContent = null);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _exportLogs() async {
    try {
      final dir = await getApplicationSupportDirectory();
      final file = File('${dir.path}/startup_crash.log');
      if (await file.exists()) {
        final fileX = XFile(file.path);
        await SharePlus.instance.share(
          ShareParams(
            files: [fileX],
            subject: 'Crash Logs',
          ),
        );
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.strings.logsExported),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.strings.oops),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _clearLogs() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(context.strings.clearLogs),
            content: Text(context.strings.confirmClearLogs),
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
      try {
        final dir = await getApplicationSupportDirectory();
        final file = File('${dir.path}/startup_crash.log');
        if (await file.exists()) {
          await file.delete();
        }
        setState(() {
          _logsContent = null;
          _isExpanded = false;
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.strings.logsCleared),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.strings.oops),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
              const Icon(Icons.bug_report),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  context.strings.crashLogs,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (_logsContent != null) ...[
                IconButton(
                  icon: const Icon(Icons.share, size: 20),
                  onPressed: _exportLogs,
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
                  if (!_isExpanded) {
                    _loadLogs();
                  } else {
                    setState(() => _isExpanded = false);
                  }
                },
              ),
            ],
          ),
          if (_isExpanded) ...[
            const SizedBox(height: 16),
            if (_isLoading)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: CircularProgressIndicator(),
                ),
              )
            else if (_logsContent == null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: context.designs.surface,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  context.strings.noCrashLogsFound,
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
                                ..._logsContent!
                                    .split('\n')
                                    .map(
                                      (log) => Text(
                                        log,
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: context.designs.textPrimary,
                                          fontSize: 12,
                                          fontFamily: 'monospace',
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
