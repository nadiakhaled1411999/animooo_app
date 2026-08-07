import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animooo_app/core/theming/app_colors.dart';
import 'package:animooo_app/core/theming/styles.dart';
 
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlined;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? backgroundColor;
  final Gradient? gradient;
  final Color? textColor;
  final double? fontSize;
  final EdgeInsets? padding;
  final double? elevation;
  final Color? borderColor;
  final double borderWidth;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.gradient,
    this.textColor,
    this.fontSize,
    this.padding,
    this.elevation,
    this.borderColor,
    this.borderWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null && !isLoading;
    final Color defaultBg = backgroundColor ?? AppColors.primary;
    final Color defaultTextColor =
        textColor ?? (isOutlined ? defaultBg : Colors.white);
    final Color defaultBorderColor = borderColor ?? defaultBg;

    BoxDecoration? boxDecoration;
    if (gradient != null) {
      boxDecoration = BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        boxShadow: isOutlined
            ? null
            : [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
        border: isOutlined
            ? Border.all(color: defaultBorderColor, width: borderWidth)
            : null,
      );
    } else if (isOutlined) {
      boxDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        border: Border.all(color: defaultBorderColor, width: borderWidth),
      );
    } else {
      boxDecoration = BoxDecoration(
        color: defaultBg,
        borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        boxShadow: elevation != null && elevation! > 0
            ? [
                BoxShadow(
                  color: defaultBg.withOpacity(0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ]
            : null,
      );
    }

    return Container(
      width: width ?? double.infinity,
      height: height ?? 48.h,
      decoration: boxDecoration,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          ),
          elevation: 0,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: isLoading
            ? SizedBox(
                width: 20.w,
                height: 20.h,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5.w,
                  color: defaultTextColor,
                ),
              )
            : Text(
                text,
                style: (fontSize != null
                    ? AppTextStyles.font15TextPrimaryBold.copyWith(
                        fontSize: fontSize,
                        color: defaultTextColor,
                      )
                    : AppTextStyles.font15TextPrimaryBold.copyWith(
                        color: defaultTextColor,
                      )),
              ),
      ),
    );
  }
}
