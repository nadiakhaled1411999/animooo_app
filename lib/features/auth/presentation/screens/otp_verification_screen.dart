import 'package:animooo_app/core/theming/app_colors.dart';
import 'package:animooo_app/features/auth/presentation/widgets/otp_widgets/otp_verification_body.dart';
import 'package:flutter/material.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: OtpVerificationBody(),
    );
  }
}
