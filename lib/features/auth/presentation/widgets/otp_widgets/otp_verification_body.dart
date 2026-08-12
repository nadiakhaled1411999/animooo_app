import 'package:animooo_app/core/helpers/spacing.dart';
import 'package:animooo_app/core/theming/styles.dart';
import 'package:animooo_app/core/widgets/custom_back_button.dart';
import 'package:animooo_app/features/auth/presentation/widgets/otp_widgets/otp_verification_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpVerificationBody extends StatelessWidget {
  const OtpVerificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(24),
                    const CustomBackButton(
                      label: 'Cancel',
                      icon: Icons.arrow_back_ios_new,
                    ),
                    verticalSpace(32),
                    Text(
                      'OTP Verification',
                      style: AppTextStyles.font20RegularPrimary,
                    ),
                    verticalSpace(12),
                    Text(
                      'Please enter the 5 digit code sent your phone number',
                      style: AppTextStyles.font14RegularTextDisabled,
                    ),
                    verticalSpace(40),
                    const OtpVerificationForm(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
