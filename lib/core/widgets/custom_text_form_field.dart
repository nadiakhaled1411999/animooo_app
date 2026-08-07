
import 'package:flutter/material.dart';
import 'package:animooo_app/core/theming/app_input_decoration.dart';
import 'package:animooo_app/core/theming/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final IconData? icon;
  final Widget? suffix;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextDirection textDirection;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int maxLines;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.hint,
    this.icon,
    this.suffix,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textDirection = TextDirection.ltr,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textDirection: textDirection,
      maxLines: maxLines,
      style: AppTextStyles.font14TextPrimaryMedium,
      validator: validator,
      onChanged: onChanged,
      decoration: icon != null
          ? AppInputDecoration.defaultDecoration(
              hint: hint ?? '',
              icon: icon!,
              suffix: suffix,
            )
          : AppInputDecoration.simpleDecoration(
              hint: hint ?? '',
              suffix: suffix,
            ),
    );
  }
}