// ignore_for_file: must_be_immutable

import 'package:ecommerce_machine_test/constants/colors.dart';
import 'package:ecommerce_machine_test/constants/styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String hintText;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Color? fillColor;
  final bool? filled;
  final bool isBoarder;
  int? maxLines = 1;
  final bool? isMaxLine;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final TextStyle? style;
  final Color borderColor;

  final bool editable;
  final String displayText;
  final bool? enabled;
  final VoidCallback? onSubmitted;
  final TextStyle? hintStyle;
  final bool? readOnly;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  CustomTextField({
    super.key,
    required this.hintText,
    this.focusNode,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.fillColor,
    this.filled,
    this.isBoarder = true,
    this.onChanged,
    this.maxLines,
    this.isMaxLine = false,
    this.onTap,
    this.style,
    this.prefixIcon,
    this.autovalidateMode,
    this.keyboardType,
    this.contentPadding,
    this.borderColor = kWhiteGrey,
    this.editable = true,
    this.displayText = '',
    this.onSubmitted,
    this.enabled,
    this.hintStyle,
    this.readOnly = false,
    this.maxLength,
    this.textInputAction,
    this.prefixIconColor,
    this.suffixIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      maxLength: maxLength,
      buildCounter: (
        BuildContext context, {
        required int currentLength,
        required bool isFocused,
        required int? maxLength,
      }) {
        return null;
      },
      readOnly: readOnly ?? false,
      enabled: enabled,
      keyboardType: keyboardType,
      autovalidateMode: autovalidateMode,
      style: style ?? CustomTextStyles.hintText,
      onTap: onTap,
      maxLines: isMaxLine! ? maxLines : 1,
      onChanged: onChanged,
      onFieldSubmitted: (_) {
        onSubmitted?.call();
      },
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      focusNode: focusNode,
      decoration: InputDecoration(
          labelStyle: CustomTextStyles.hintText,
          hintStyle: hintStyle ?? CustomTextStyles.hintText,
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor,
          suffixIconColor: suffixIconColor,
          fillColor: fillColor,
          filled: filled,
          suffixIcon: suffixIcon,
          hintText: hintText,
          contentPadding: contentPadding ?? const EdgeInsets.all(14),
          isCollapsed: true,
          isDense: true,
          focusedErrorBorder: isBoarder
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(8),
                )
              : const OutlineInputBorder(borderSide: BorderSide.none),
          disabledBorder: isBoarder
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.circular(8),
                )
              : const OutlineInputBorder(borderSide: BorderSide.none),
          errorBorder: isBoarder
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(8),
                )
              : const OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: isBoarder
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.circular(8),
                )
              : const OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: isBoarder
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.circular(8),
                )
              : const OutlineInputBorder(borderSide: BorderSide.none)),
    );
  }
}
