import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animooo_app/core/theming/styles.dart';
import 'app_colors.dart';
 

class AppInputDecoration {
  static InputDecoration defaultDecoration({
    required String hint,
    required IconData icon,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: AppTextStyles.font12TextSecondaryMedium.copyWith(
        letterSpacing: 0.3,
      ),
      prefixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Icon(
          icon,
          color: AppColors.textSecondary,
          size: 20.sp,
        ),
      ),
      prefixIconConstraints: BoxConstraints(minWidth: 48.w),
      suffixIcon: suffix != null
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: suffix,
            )
          : null,
      suffixIconConstraints: BoxConstraints(minWidth: 48.w),
      filled: true,
      fillColor: AppColors.surface,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 14.h,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.error, width: 1.5),
      ),
      errorStyle: AppTextStyles.font12ErrorMedium,
    );
  }

  static InputDecoration simpleDecoration({
    required String hint,
    Widget? suffix,
  }) {
    return defaultDecoration(
      hint: hint,
      icon: Icons.text_fields,
      suffix: suffix,
    ).copyWith(
      prefixIcon: null,
      prefixIconConstraints: const BoxConstraints(),
    );
  }
}