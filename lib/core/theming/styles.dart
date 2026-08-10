import 'package:animooo_app/core/helpers/font_weight_helper.dart';
import 'package:animooo_app/core/theming/app_colors.dart';
import 'package:animooo_app/core/theming/font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  AppTextStyles._();

  // ── 34 ────────────────────────────────────────────────

  static TextStyle font34RegularBlack = TextStyle(
    fontFamily: FontFamilies.otama,
    fontSize: 34.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.black,
  );

  // ── 14 ────────────────────────────────────────────────

  static TextStyle font14RegularTextSecondary = TextStyle(
    fontFamily: FontFamilies.poppins,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.textSecondary,
  );

  // ── 12 ────────────────────────────────────────────────

  static TextStyle font12RegularTextTertiary = TextStyle(
    fontFamily: FontFamilies.poppins,
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.textTertiary,
  );

  static TextStyle font12RegularTextPrimary = TextStyle(
    fontFamily: FontFamilies.poppins,
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.textPrimary,
  );

  static TextStyle font12MediumTextDisabled = TextStyle(
    fontFamily: FontFamilies.poppins,
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.textDisabled,
  );

  static TextStyle font12MediumPrimary = TextStyle(
    fontFamily: FontFamilies.poppins,
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.primary,
  );
  static TextStyle font12RegularPrimary = TextStyle(
    fontFamily: FontFamilies.poppins,
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.primary,
  );

  // ── 11 ────────────────────────────────────────────────

  static TextStyle font11MediumPrimary = TextStyle(
    fontFamily: FontFamilies.poppins,
    fontSize: 11.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.primary,
  );

  // ── 10 ────────────────────────────────────────────────

  static TextStyle font10RegularTextPrimary = TextStyle(
    fontFamily: FontFamilies.poppins,
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.textPrimary,
  );

  static TextStyle font10RegularTextTertiary = TextStyle(
    fontFamily: FontFamilies.poppins,
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.textTertiary,
  );

  static TextStyle font10SemiBoldPrimary = TextStyle(
    fontFamily: FontFamilies.poppins,
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.primary,
  );

  static TextStyle font10RegularWhite = TextStyle(
    fontFamily: FontFamilies.poppins,
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.white,
  );

  // ── Error ─────────────────────────────────────────────

  static TextStyle font10RegularError = TextStyle(
    fontFamily: FontFamilies.poppins,
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.red,
  );

  static TextStyle font10RegularGreen = TextStyle(
    fontFamily: FontFamilies.poppins,
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.green,
  );

  static TextStyle font12RegularGreen = TextStyle(
    fontFamily: FontFamilies.poppins,
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.green,
  );

  static TextStyle font12RegularError = TextStyle(
    fontFamily: FontFamilies.poppins,
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.red,
  );
}
