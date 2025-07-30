import 'package:flutter/material.dart';

extension ImageFullViewExt on Widget {
  void _openImageToFullScreen(BuildContext context) {
    final page = MaterialPageRoute(builder: (_) => _ImageFullView(child: this));
    Navigator.of(context).push(page);
  }

  Widget get canFull {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () => _openImageToFullScreen(context),
          child: this,
        );
      },
    );
  }
}

class _ImageFullView extends StatelessWidget {
  final Widget child;

  const _ImageFullView({required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white24,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: InteractiveViewer(
                boundaryMargin: const EdgeInsets.all(double.infinity),
                minScale: 0.5,
                maxScale: 4.0,
                child: AspectRatio(aspectRatio: 1, child: child),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: Navigator.of(context).maybePop,
                icon: const Icon(Icons.close_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
