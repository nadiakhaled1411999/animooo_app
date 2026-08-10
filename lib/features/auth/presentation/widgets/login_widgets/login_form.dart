import 'package:animooo_app/core/helpers/form_validators.dart';
import 'package:animooo_app/core/helpers/spacing.dart';
import 'package:animooo_app/core/widgets/custom_button.dart';
import 'package:animooo_app/core/widgets/custom_text_form_field.dart';
import 'package:animooo_app/features/auth/presentation/widgets/login_widgets/forgot_password.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

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
              label: 'Email',
              hint: 'Enter your email address',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (value) =>
                  FormValidators.required(value, 'Email is required'),
            ),

            verticalSpace(16),

            CustomTextFormField(
              label: 'Password',
              hint: '*********',
              isPassword: true,
              textInputAction: TextInputAction.done,
              validator: (value) =>
                  FormValidators.required(value, 'Password is required'),
            ),

            verticalSpace(12),

            const ForgotPassword(),

            verticalSpace(60),

            CustomButton(
              label: 'Log In',
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
