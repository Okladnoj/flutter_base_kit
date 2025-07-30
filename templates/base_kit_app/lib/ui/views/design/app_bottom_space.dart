import 'package:flutter/material.dart';

class AppBottomSpace extends StatelessWidget {
  final int flex;

  const AppBottomSpace({
    super.key,
    this.flex = 7,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height / flex);
  }
}
