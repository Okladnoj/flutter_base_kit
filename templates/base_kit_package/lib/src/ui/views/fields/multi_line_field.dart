import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';

class MultiLineField extends StatefulWidget {
  final TextEditingController controller;
  final bool autofocus;
  final TextCapitalization textCapitalization;
  final int? minLines;
  final int? maxLines;
  final String? hintText;
  final String? helperText;
  final bool helperTextLeft;
  final String? errorText;
  final String? counterText;
  final int? maxLength;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? contentPadding;
  final bool withBorder;
  final Color? textColor;
  final double? fontSize;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final Widget? suffixIcon;
  final bool expands;
  final TextAlignVertical? textAlignVertical;

  const MultiLineField({
    super.key,
    required this.controller,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.hintText,
    this.helperText,
    this.helperTextLeft = false,
    this.errorText,
    this.counterText,
    this.maxLength,
    this.fontWeight,
    this.minLines,
    this.maxLines = 3,
    this.contentPadding = const EdgeInsets.fromLTRB(16, 14, 16, 14),
    this.withBorder = true,
    this.textColor,
    this.fontSize = 17,
    this.backgroundColor,
    this.borderRadius,
    this.suffixIcon,
    this.expands = false,
    this.textAlignVertical = TextAlignVertical.top,
  });

  @override
  State<MultiLineField> createState() => _MultiLineFieldState();
}

class _MultiLineFieldState extends State<MultiLineField> {
  final _focus = FocusNode();

  void _onTapOutside(PointerDownEvent pointerDownEvent) {
    final focused = _focus.hasFocus;

    if (focused) {
      _focus.unfocus();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide:
          !widget.withBorder
              ? BorderSide.none
              : BorderSide(color: context.designs.surface),
      borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
      gapPadding: 1,
    );
    final focusedBorder = border.copyWith(
      borderSide:
          !widget.withBorder
              ? BorderSide.none
              : BorderSide(color: context.designs.surface),
    );
    final focusedErrorBorder = border.copyWith(
      borderSide:
          !widget.withBorder
              ? BorderSide.none
              : BorderSide(color: context.designs.error),
    );
    return TextFormField(
      cursorColor: widget.textColor ?? context.designs.textPrimary,
      focusNode: _focus,
      onTapOutside: _onTapOutside,
      controller: widget.controller,
      autofocus: widget.autofocus,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      style: context.textTheme.bodyMedium?.copyWith(
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight ?? FontWeight.w900,
        color: widget.textColor ?? context.designs.textPrimary,
      ),
      textCapitalization: widget.textCapitalization,
      scrollPadding: const EdgeInsets.only(),
      maxLength: widget.maxLength,
      expands: widget.expands,
      textAlignVertical: widget.textAlignVertical,
      decoration: InputDecoration(
        contentPadding: widget.contentPadding,
        hintText: widget.hintText,
        border: InputBorder.none,
        fillColor: widget.backgroundColor ?? context.designs.surface,
        filled: true,
        focusedBorder: focusedBorder,
        disabledBorder: border,
        errorBorder: border,
        focusedErrorBorder: focusedErrorBorder,
        enabledBorder: border,
        isDense: true,
        errorMaxLines: 3,
        counterStyle: context.textTheme.bodyMedium?.copyWith(
          fontSize: widget.fontSize,
          color: context.designs.textPrimary,
        ),
        hintStyle: context.textTheme.bodyMedium?.copyWith(
          fontSize: widget.fontSize,
          color: context.designs.textPrimary,
        ),
        errorText: widget.errorText,
        helperText: widget.helperText,
        helperStyle: context.textTheme.bodyMedium?.copyWith(
          fontSize: widget.fontSize,
          color: context.designs.textPrimary,
        ),
        counterText: widget.counterText ?? '',
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
