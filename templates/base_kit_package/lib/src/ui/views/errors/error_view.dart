import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String message;

  const ErrorView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[300],
      child: Center(child: Text(message)),
    );
  }
}
