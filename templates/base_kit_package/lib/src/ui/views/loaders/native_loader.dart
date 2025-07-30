import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';

class NativeLoader extends StatelessWidget {
  final double? value;

  const NativeLoader({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: context.designs.primary,
      strokeWidth: 2,
      value: value,
    );
  }
}
