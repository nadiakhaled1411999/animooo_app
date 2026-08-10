import 'package:animooo_app/core/helpers/spacing.dart';
import 'package:animooo_app/core/theming/styles.dart';
import 'package:animooo_app/core/widgets/custom_back_button.dart';
import 'package:animooo_app/features/auth/presentation/widgets/forgot_password_widgets/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

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
                    const CustomBackButton(),
                    verticalSpace(48),
                    Text(
                      'Forget Your Password ?',
                      style: AppTextStyles.font34RegularPrimary,
                    ),
                    verticalSpace(12),
                    Text(
                      "Please enter the email address associated with your "
                      "account, and we'll send you OTP to reset your password.",
                      style: AppTextStyles.font14RegularTextSecondary,
                    ),
                    verticalSpace(48),
                    const ForgotPasswordForm(),
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
