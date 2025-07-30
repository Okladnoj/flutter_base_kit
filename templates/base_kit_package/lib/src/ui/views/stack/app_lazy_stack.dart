import 'package:flutter/widgets.dart';

class AppLazyIndexedStack extends StatefulWidget {
  late final Widget unloadWidget;
  final AlignmentGeometry alignment;
  final StackFit sizing;
  final TextDirection? textDirection;
  final int index;
  final List<Widget> children;

  AppLazyIndexedStack({
    super.key,
    Widget? unloadWidget,
    this.alignment = AlignmentDirectional.topStart,
    this.sizing = StackFit.loose,
    this.textDirection,
    required this.index,
    required this.children,
  }) {
    this.unloadWidget = unloadWidget ?? Container();
  }

  @override
  State<AppLazyIndexedStack> createState() => _AppLazyIndexedStackState();
}

class _AppLazyIndexedStackState extends State<AppLazyIndexedStack> {
  late List<Widget> _children;
  final _stackKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _children = _initialChildren();
  }

  @override
  void didUpdateWidget(final AppLazyIndexedStack oldWidget) {
    super.didUpdateWidget(oldWidget);

    _children[widget.index] = widget.children[widget.index];
  }

  @override
  Widget build(final BuildContext context) {
    return IndexedStack(
      key: _stackKey,
      index: widget.index,
      alignment: widget.alignment,
      textDirection: widget.textDirection,
      sizing: widget.sizing,
      children: _children,
    );
  }

  List<Widget> _initialChildren() {
    return widget.children.asMap().entries.map((entry) {
      final index = entry.key;
      final childWidget = entry.value;
      return index == widget.index ? childWidget : widget.unloadWidget;
    }).toList();
  }
}
