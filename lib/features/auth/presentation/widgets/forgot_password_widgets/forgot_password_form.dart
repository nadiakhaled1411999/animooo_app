import 'package:animooo_app/core/helpers/form_validators.dart';
import 'package:animooo_app/core/helpers/spacing.dart';
import 'package:animooo_app/core/routing/routes.dart';
import 'package:animooo_app/core/theming/app_colors.dart';
import 'package:animooo_app/core/theming/styles.dart';
import 'package:animooo_app/core/widgets/custom_button.dart';
import 'package:animooo_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final maxWidth = (screenWidth * 0.85).clamp(280.0, 400.0);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
      ),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextFormField(
              label: 'Email',
              hint: 'Enter your email address',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              validator: FormValidators.email,
              borderColor: AppColors.inputBorder,
            ),
            verticalSpace(90),
            CustomButton(
              label: 'Send Code',
              textStyle: AppTextStyles.font12RegularWhite,
              onPressed: () {
                _formKey.currentState?.validate();
                //!
                 Navigator.pushNamed(context, Routes.createNewPassword);
              },
            ),
          ],
        ),
      ),
    );
  }
}
