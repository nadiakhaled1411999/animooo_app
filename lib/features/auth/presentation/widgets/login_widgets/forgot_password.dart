import 'package:animooo_app/core/routing/routes.dart';
import 'package:animooo_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
         // Navigator.pushNamed(context, Routes.forgotPassword);
            Navigator.pushNamed(context, Routes.otpVerification);
        },
        child: Text(
          'Forgot Password?',
          style: AppTextStyles.font10SemiBoldPrimary,
        ),
      ),
    );
  }
}
