import 'package:animooo_app/core/theming/app_colors.dart';
import 'package:animooo_app/features/auth/presentation/widgets/forgot_password_widgets/forgot_password_body.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: ForgotPasswordBody(),
    );
  }
}
