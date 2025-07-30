import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';
import '../filters/blur_filter.dart';

class WidgetDialog extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? dismissHandel;

  const WidgetDialog({
    super.key,
    this.child = const SizedBox.shrink(),
    this.padding = const EdgeInsets.all(20),
    this.dismissHandel,
  });

  @override
  State<WidgetDialog> createState() => _WidgetDialogState();
}

class _WidgetDialogState extends State<WidgetDialog> {
  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(12);
    return GestureDetector(
      onTap: () {
        widget.dismissHandel?.call();
        Navigator.maybePop(context);
      },
      child: Material(
        color: Colors.transparent,
        child: CustomScrollView(
          slivers: [
            const SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  SizedBox(height: 150),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: widget.padding,
                  child: BlurFilter(
                    borderRadius: borderRadius,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                      decoration: BoxDecoration(
                        color: context.designs.background,
                        borderRadius: borderRadius,
                      ),
                      child: widget.child,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
