import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieView extends StatefulWidget {
  final String lottiePath;
  final double? width;
  final double? height;
  final Duration duration;
  final Curve curve;
  final bool repeat;
  final BoxFit fit;

  const LottieView({
    super.key,
    required this.lottiePath,
    this.width,
    this.height,
    this.duration = const Duration(seconds: 1),
    this.curve = Curves.linear,
    this.repeat = true,
    this.fit = BoxFit.contain,
  });

  @override
  State<LottieView> createState() => _LottieViewState();
}

class _LottieViewState extends State<LottieView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);

    widget.repeat ? _controller.repeat() : _controller.forward();
  }

  @override
  void didUpdateWidget(covariant LottieView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
      if (!_controller.isAnimating) _controller.forward(from: 0);
    }

    if (oldWidget.curve != widget.curve) {
      _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    }

    if (oldWidget.repeat != widget.repeat) {
      widget.repeat ? _controller.repeat() : _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      widget.lottiePath,
      controller: _animation,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
    );
  }
}
