import 'package:flutter/material.dart';

import '../../themes/colors_set.dart';

class ErrorView extends StatelessWidget {
  final String message;

  const ErrorView({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsSet.colorSchemeError,
      child: Center(child: Text(message)),
    );
  }
}
