import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animooo_app/core/theming/app_colors.dart';
import 'package:animooo_app/core/theming/styles.dart';

class CustomDivider extends StatelessWidget {
  final String text;
  final double horizontalPadding;

  const CustomDivider({
    super.key,
    required this.text ,
    required this.horizontalPadding ,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: AppColors.borderColor, thickness: 1),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
          child: Text(
            text,
            style: AppTextStyles.font13TextSecondaryMedium,
          ),
        ),
        const Expanded(
          child: Divider(color: AppColors.borderColor, thickness: 1),
        ),
      ],
    );
  }
}