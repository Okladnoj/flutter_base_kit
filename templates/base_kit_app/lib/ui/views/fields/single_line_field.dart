import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../themes/app_theme.dart';

class SingleLineField extends StatefulWidget {
  final TextEditingController controller;
  final int? maxLength;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool withBorder;
  final Color? backgroundColor;
  final Color? hintTextColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontWeight? fontWeightHint;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final bool isDense;
  final bool enable;
  final int? maxLines;
  final TextInputType? textInputType;
  final List<TextInputFormatter> inputFormatters;
  final VoidCallback? onTapOutside;
  final TextAlign textAlign;
  final Widget? prefix;

  const SingleLineField({
    super.key,
    this.maxLength,
    required this.controller,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.withBorder = true,
    this.backgroundColor,
    this.hintTextColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.fontWeightHint,
    this.borderRadius,
    this.padding,
    this.isDense = true,
    this.enable = true,
    this.maxLines = 1,
    this.textInputType,
    this.inputFormatters = const [],
    this.onTapOutside,
    this.textAlign = TextAlign.start,
    this.prefix,
  });

  @override
  State<SingleLineField> createState() => _SingleLineFieldState();
}

class _SingleLineFieldState extends State<SingleLineField> {
  final _focus = FocusNode();

  void _onTapOutside(PointerDownEvent pointerDownEvent) {
    final focused = _focus.hasFocus;

    if (focused) {
      _focus.unfocus();
      FocusScope.of(context).unfocus();
      widget.onTapOutside?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: !widget.withBorder
          ? BorderSide.none
          : BorderSide(
              color: context.designs.surface,
            ),
      borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
      gapPadding: 1,
    );
    final focusedBorder = border.copyWith(
      borderSide: !widget.withBorder
          ? BorderSide.none
          : BorderSide(
              color: context.designs.surface,
            ),
    );
    final focusedErrorBorder = border.copyWith(
      borderSide: !widget.withBorder
          ? BorderSide.none
          : BorderSide(color: context.designs.error),
    );

    return TextFormField(
      key: widget.key,
      controller: widget.controller,
      cursorColor: widget.textColor ?? context.designs.textPrimary,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      textAlign: widget.textAlign,
      textCapitalization: TextCapitalization.sentences,
      focusNode: _focus,
      onTapOutside: _onTapOutside,
      maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
      style: context.textTheme.bodyMedium?.copyWith(
        fontSize: widget.fontSize ?? 17,
        fontWeight: widget.fontWeight ?? FontWeight.w900,
        color: widget.textColor ?? context.designs.textPrimary,
      ),
      scrollPadding: const EdgeInsets.only(),
      keyboardType: widget.textInputType,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        contentPadding:
            widget.padding ?? const EdgeInsets.fromLTRB(16, 14, 16, 14),
        prefixIcon: widget.prefixIcon,
        prefix: widget.prefix,
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText,
        border: InputBorder.none,
        fillColor: widget.backgroundColor ?? context.designs.surface,
        filled: true,
        focusedBorder: focusedBorder,
        disabledBorder: border,
        errorBorder: border,
        focusedErrorBorder: focusedErrorBorder,
        enabledBorder: border,
        isDense: widget.isDense,
        enabled: widget.enable,
        errorMaxLines: 3,
        counterStyle: context.textTheme.bodyMedium?.copyWith(
          fontSize: widget.fontSize ?? 17,
          fontWeight: widget.fontWeightHint ?? FontWeight.w900,
          color: context.designs.textPrimary,
        ),
        hintStyle: context.textTheme.bodyMedium?.copyWith(
          fontSize: widget.fontSize ?? 17,
          fontWeight: widget.fontWeightHint ?? FontWeight.w900,
          color: widget.hintTextColor ?? context.designs.textPrimary,
        ),
        errorText: widget.errorText,
        helperText: widget.helperText,
        helperStyle: context.textTheme.bodyMedium?.copyWith(
          fontSize: widget.fontSize ?? 17,
          fontWeight: widget.fontWeightHint ?? FontWeight.w900,
          color: context.designs.textPrimary,
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: capitalize(newValue.text),
      selection: newValue.selection,
    );
  }
}

String capitalize(String value) {
  if (value.trim().isEmpty) return '';

  return '${value[0].toUpperCase()}${value.substring(1).toLowerCase()}';
}
