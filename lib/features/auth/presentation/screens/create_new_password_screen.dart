import 'package:animooo_app/core/theming/app_colors.dart';
import 'package:animooo_app/features/auth/presentation/widgets/create_new_password_widgets/create_new_password_body.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: CreateNewPasswordBody(),
    );
  }
}
