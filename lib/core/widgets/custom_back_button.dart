import 'package:animooo_app/core/helpers/spacing.dart';
import 'package:animooo_app/core/theming/app_colors.dart';
import 'package:animooo_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Reusable back button that pops the current route.
class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.arrow_back,
            size: 20.sp,
            color: AppColors.primary,
          ),
          horizontalSpace(6),
          Text(
            'Back',
            style: AppTextStyles.font12MediumPrimary,
          ),
        ],
      ),
    );
  }
}
