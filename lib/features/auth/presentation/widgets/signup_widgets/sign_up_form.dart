import 'package:animooo_app/core/helpers/form_validators.dart';
import 'package:animooo_app/core/helpers/spacing.dart';
import 'package:animooo_app/core/theming/app_colors.dart';
import 'package:animooo_app/core/theming/styles.dart';
import 'package:animooo_app/core/widgets/custom_button.dart';
import 'package:animooo_app/core/widgets/custom_text_form_field.dart';
import 'package:animooo_app/features/auth/presentation/widgets/signup_widgets/password_validation.dart';
import 'package:animooo_app/features/auth/presentation/widgets/signup_widgets/profile_image_upload.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _passwordNotifier = ValueNotifier<String>('');

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
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
              label: 'First Name',
              hint: 'Enter your first name',
              controller: _firstNameController,
              textInputAction: TextInputAction.next,
              validator: (value) =>
                  FormValidators.required(value, 'First name is required'),
            ),
            verticalSpace(16),
            CustomTextFormField(
              label: 'Last Name',
              hint: 'Enter your last name',
              controller: _lastNameController,
              textInputAction: TextInputAction.next,
              validator: (value) =>
                  FormValidators.required(value, 'Last name is required'),
            ),
            verticalSpace(16),
            CustomTextFormField(
              label: 'Email',
              hint: 'Enter your email address',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: FormValidators.email,
            ),
            verticalSpace(16),
            CustomTextFormField(
              label: 'Phone',
              hint: 'Enter your phone number',
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              validator: (value) =>
                  FormValidators.required(value, 'Phone number is required'),
            ),
            verticalSpace(16),
            CustomTextFormField(
              label: 'Password',
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
            verticalSpace(16),
            Text(
              'Upload Image For Your Profile',
              style: AppTextStyles.font14RegularTextSecondary,
            ),
            verticalSpace(8),
            const ProfileImageUpload(),
            verticalSpace(60),
            CustomButton(
              label: 'Sign Up',
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
