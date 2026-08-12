import 'package:animooo_app/core/helpers/form_validators.dart';
import 'package:animooo_app/core/helpers/spacing.dart';
import 'package:animooo_app/core/theming/app_colors.dart';
import 'package:animooo_app/core/theming/styles.dart';
import 'package:animooo_app/core/widgets/custom_button.dart';
import 'package:animooo_app/core/widgets/custom_text_form_field.dart';
import 'package:animooo_app/features/auth/presentation/widgets/signup_widgets/password_validation.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordForm extends StatefulWidget {
  const CreateNewPasswordForm({super.key});

  @override
  State<CreateNewPasswordForm> createState() => _CreateNewPasswordFormState();
}

class _CreateNewPasswordFormState extends State<CreateNewPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _passwordNotifier = ValueNotifier<String>('');

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _passwordNotifier.dispose();
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              label: 'New Password',
              hint: '*********',
              controller: _passwordController,
              isPassword: true,
              textInputAction: TextInputAction.next,
              validator: FormValidators.strongPassword,
              textStyle: AppTextStyles.font12RegularTextSecondary,
              borderColor: AppColors.inputBorder,
              onChanged: (value) => _passwordNotifier.value = value,
            ),
            verticalSpace(8),
            PasswordValidation(password: _passwordNotifier),
            verticalSpace(16),
            CustomTextFormField(
              label: 'Confirm Password',
              hint: '*********',
              controller: _confirmPasswordController,
              isPassword: true,
              textInputAction: TextInputAction.done,
              validator: (value) => FormValidators.confirmPassword(
                value,
                _passwordController.text,
              ),
            ),
            verticalSpace(90),
            CustomButton(
              label: 'Submit',
              textStyle: AppTextStyles.font12RegularWhite,
              onPressed: () {
                _formKey.currentState?.validate();
              },
            ),
          ],
        ),
      ),
    );
  }
}
