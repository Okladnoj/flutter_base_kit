import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppBottomSheet<T> {
  final BuildContext _context;

  const AppBottomSheet._(this._context);

  factory AppBottomSheet.of(BuildContext context) => AppBottomSheet._(context);

  Future<T?> showBottomSheet({
    required Widget body,
    Color? barrierColor = const Color(0x00000000),
    bool isScrollControlled = true,
  }) {
    return showModalBottomSheet<T>(
      context: _context,
      isScrollControlled: isScrollControlled,
      barrierColor: barrierColor,
      backgroundColor: const Color(0x00000000),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(14),
        ),
      ),
      elevation: 0,
      builder: (context) => GestureDetector(
        onTap: context.router.maybePop,
        child: body,
      ),
    );
  }
}
