import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';
import '../theming/app_colors.dart';
import '../theming/styles.dart';

/// Reusable form field with label, fixed height, red error border
/// and the error message shown below the field without changing its height.
class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.isPassword = false,
    this.onChanged,
  });

  final String label;
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool isPassword;
  final ValueChanged<String>? onChanged;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText = widget.isPassword;

  OutlineInputBorder _border({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: color == null
          ? BorderSide.none
          : BorderSide(
              color: color,
              width: 1.2,
            ),
    );
  }

  InputDecoration _inputDecoration(String? errorText) {
    return InputDecoration(
      hintText: widget.hint,
      hintStyle: AppTextStyles.font10RegularTextTertiary,
      filled: true,
      fillColor: AppColors.inputBackground,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      enabledBorder: _border(),
      focusedBorder: _border(
        color: AppColors.primary,
      ),
      errorBorder: _border(
        color: AppColors.red,
      ),
      focusedErrorBorder: _border(
        color: AppColors.red,
      ),
      suffixIcon: widget.isPassword ? _visibilityIcon() : null,
      errorText: errorText,
      errorStyle: const TextStyle(
        fontSize: 0,
        height: 0,
        color: AppColors.red,
      ),
    );
  }

  Widget _visibilityIcon() {
    return IconButton(
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
      icon: Icon(
        _obscureText ? Icons.visibility_off : Icons.visibility,
        size: 20.sp,
        color: AppColors.iconSecondary,
      ),
      splashRadius: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: widget.validator,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: AppTextStyles.font14RegularTextSecondary,
            ),
            verticalSpace(6),
            SizedBox(
              height: 52.h,
              child: TextField(
                controller: widget.controller,
                obscureText: widget.isPassword && _obscureText,
                keyboardType: widget.keyboardType,
                textInputAction: widget.textInputAction,
                style: AppTextStyles.font12RegularTextPrimary,
                decoration: _inputDecoration(field.errorText),
                onChanged: (value) {
                  field.didChange(value);
                  widget.onChanged?.call(value);
                },
              ),
            ),
            if (field.errorText != null)
              Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Text(
                  field.errorText!,
                  style: AppTextStyles.font10RegularError,
                ),
              ),
          ],
        );
      },
    );
  }
}
