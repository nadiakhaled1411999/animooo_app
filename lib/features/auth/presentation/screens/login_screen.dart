import 'package:animooo_app/core/theming/app_colors.dart';
import 'package:animooo_app/features/auth/presentation/widgets/login_widgets/login_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: LoginBody(),
    );
  }
}
