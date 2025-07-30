import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';

class RunningDotsAnimation extends StatefulWidget {
  final Color? color;
  final double dotRadiusMax;
  final double dotRadiusMin;
  final int dotCount;
  final double spacing;
  final double speed;

  const RunningDotsAnimation({
    super.key,
    this.color,
    this.dotRadiusMax = 8,
    this.dotRadiusMin = 1,
    this.dotCount = 7,
    this.spacing = 20,
    this.speed = 150,
  });

  @override
  State<RunningDotsAnimation> createState() => _RunningDotsAnimationState();
}

class _RunningDotsAnimationState extends State<RunningDotsAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late double canvasWidth;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: const Cubic(0.1, 0.4, 0.9, 0.4),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        canvasWidth = constraints.maxWidth;
        final duration = canvasWidth / widget.speed;
        _controller.duration = Duration(seconds: duration.toInt());
        _controller.repeat();

        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return CustomPaint(
              painter: RunningDotsPainter(
                _animation.value,
                color: widget.color ?? context.designs.background,
                dotRadiusMin: widget.dotRadiusMin,
                dotRadiusMax: widget.dotRadiusMax,
                dotCount: widget.dotCount,
                spacing: widget.spacing,
                canvasWidth: canvasWidth,
              ),
              child: SizedBox(
                width: double.infinity,
                height: widget.dotRadiusMax * 4,
              ),
            );
          },
        );
      },
    );
  }
}

class RunningDotsPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double dotRadiusMax;
  final double dotRadiusMin;
  final int dotCount;
  final double spacing;
  final double canvasWidth;

  RunningDotsPainter(
    this.progress, {
    required this.color,
    required this.dotRadiusMax,
    required this.dotRadiusMin,
    required this.dotCount,
    required this.spacing,
    required this.canvasWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    for (int i = 0; i < dotCount; i++) {
      double x = (i * spacing + progress * (canvasWidth + spacing)) %
          (canvasWidth + spacing);
      double y = size.height / 2;

      double distanceToCenter = (x - canvasWidth / 2).abs();
      double scaleFactor =
          (1 - distanceToCenter / (canvasWidth / 2)).clamp(0.0, 1.0);
      double radius =
          dotRadiusMin + (dotRadiusMax - dotRadiusMin) * scaleFactor;

      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
