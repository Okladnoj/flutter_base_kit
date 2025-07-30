import 'package:flutter/material.dart';

class SwipeDetector extends StatefulWidget {
  final Widget child;
  final ValueSetter<bool> onSwipe;

  const SwipeDetector({super.key, required this.child, required this.onSwipe});

  @override
  State<SwipeDetector> createState() => _SwipeDetectorState();
}

class _SwipeDetectorState extends State<SwipeDetector> {
  Offset _startingPosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        _startingPosition = details.localPosition;
      },
      onPanEnd: (details) {
        final currentPosition = details.velocity.pixelsPerSecond;
        final delta = currentPosition - _startingPosition;
        final isSwipeRight = delta.dx > 0 && delta.dx.abs() > delta.dy.abs();
        widget.onSwipe(isSwipeRight);
      },
      child: widget.child,
    );
  }
}
