import 'package:ecommerce_machine_test/constants/colors.dart';
import 'package:ecommerce_machine_test/widgets/textfield.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function()? onSubmitted;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final bool obscureText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  const CommonTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.onSubmitted,
    this.focusNode,
    this.autovalidateMode,
    this.obscureText = false,
    this.suffixIcon,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      suffixIcon: suffixIcon,
      autovalidateMode: autovalidateMode,
      obscureText: obscureText,
      onSubmitted: onSubmitted,
      focusNode: focusNode,
      validator: validator,
      controller: controller,
      hintText: hintText,
      borderColor: kWhiteGrey,
      fillColor: kWhiteGrey,
      filled: true,
    );
  }
}
