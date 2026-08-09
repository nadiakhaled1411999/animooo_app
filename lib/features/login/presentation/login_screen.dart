import 'package:animooo_app/core/helpers/spacing.dart';
import 'package:animooo_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/theming/app_colors.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  double _formWidth(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return (screenWidth * 0.85).clamp(280.0, 400.0);
  }

  OutlineInputBorder _border({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: color == null
          ? BorderSide.none
          : BorderSide(
              color: color,
              width: 1.2,
            ),
    );
  }

  InputDecoration _inputDecoration({
    required String hint,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: AppTextStyles.font10RegularTextTertiary,
      filled: true,
      fillColor: AppColors.inputBackground,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      enabledBorder: _border(),
      focusedBorder: _border(
        color: AppColors.primary,
      ),
      errorBorder: _border(
        color: AppColors.red,
      ),
      focusedErrorBorder: _border(
        color: AppColors.red,
      ),
      suffixIcon: suffixIcon,
      errorStyle: AppTextStyles.font12RegularError,
    );
  }

  Widget _fieldLabel(String label) {
    return Text(
      label,
      style: AppTextStyles.font14RegularTextSecondary,
    );
  }

  Widget _emailField() {
    return SizedBox(
      height: 52.h,
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        style: AppTextStyles.font12RegularTextPrimary,
        decoration: _inputDecoration(
          hint: 'Enter your email address',
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Email is required';
          }

          return null;
        },
      ),
    );
  }

  Widget _passwordField() {
    return SizedBox(
      height: 52.h,
      child: TextFormField(
        controller: _passwordController,
        obscureText: _obscurePassword,
        style: AppTextStyles.font12RegularTextPrimary,
        decoration: _inputDecoration(
          hint: '*********',
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
            icon: Icon(
              _obscurePassword
                  ? Icons.visibility_off
                  : Icons.visibility,
              size: 20.sp,
              color: AppColors.iconSecondary,
            ),
            splashRadius: 20,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Password is required';
          }

          return null;
        },
      ),
    );
  }

  Widget _forgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          // TODO: navigate to forgot password.
        },
        child: Text(
          'Forgot Password?',
          style: AppTextStyles.font10SemiBoldPrimary,
        ),
      ),
    );
  }

  Widget _loginButton() {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: Material(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            if (_formKey.currentState?.validate() ?? false) {
              // TODO: navigate to home.
            }
          },
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: Text(
              'Log In',
              style: AppTextStyles.font10RegularWhite,
            ),
          ),
        ),
      ),
    );
  }

  Widget _signUpText() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Don't have an account? ",
            style: AppTextStyles.font12MediumTextDisabled,
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: GestureDetector(
              onTap: () {
                // TODO: navigate to sign up.
              },
              child: Text(
                'Sign up now',
                style: AppTextStyles.font12MediumPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.logoApp,
                        width: 100.w,
                      ),

                      Center(
                        child: Text(
                          'ANIMOOO',
                          style: AppTextStyles.font11MediumPrimary,
                        ),
                      ),

                      verticalSpace(20),

                      Text(
                        'Log In',
                        style: AppTextStyles.font34RegularBlack,
                      ),

                      verticalSpace(40),

                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: _formWidth(context),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _fieldLabel('Email'),

                              verticalSpace(6),

                              _emailField(),

                              verticalSpace(16),

                              _fieldLabel('Password'),

                              verticalSpace(6),

                              _passwordField(),

                              verticalSpace(12),

                              _forgotPassword(),

                              verticalSpace(60),

                              _loginButton(),
                            ],
                          ),
                        ),
                      ),

                      verticalSpace(150),

                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 8.h,
                        ),
                        child: _signUpText(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
