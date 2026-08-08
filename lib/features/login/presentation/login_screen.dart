import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theming/font_family.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const Color _teal = Color(0xFF003F36);
  static const Color _inputBackground = Color(0xFFF5F5F5);
  static const Color _grayLabel = Color(0xFF8A8A8A);
  static const Color _placeholder = Color(0xFFB5B5B5);
  static const Color _error = Color(0xFFFF0000);

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
      borderSide: color == null ? BorderSide.none : BorderSide(color: color, width: 1.2),
    );
  }

  InputDecoration _inputDecoration({
    required String hint,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(fontSize: 14.sp, color: _placeholder),
      filled: true,
      fillColor: _inputBackground,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      enabledBorder: _border(),
      focusedBorder: _border(color: _teal),
      errorBorder: _border(color: _error),
      focusedErrorBorder: _border(color: _error),
      suffixIcon: suffixIcon,
      errorStyle: TextStyle(fontSize: 12.sp, color: _error),
    );
  }

  Widget _fieldLabel(String label) {
    return Text(
      label,
      style: TextStyle(fontSize: 14.sp, color: _grayLabel, fontWeight: FontWeight.w500),
    );
  }

  Widget _emailField() {
    return SizedBox(
      height: 52,
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(fontSize: 16.sp, color: Colors.black),
        decoration: _inputDecoration(hint: 'Enter your email address'),
        validator: (value) =>
            (value == null || value.trim().isEmpty) ? 'Email is required' : null,
      ),
    );
  }

  Widget _passwordField() {
    return SizedBox(
      height: 52,
      child: TextFormField(
        controller: _passwordController,
        obscureText: _obscurePassword,
        style: TextStyle(fontSize: 16.sp, color: Colors.black),
        decoration: _inputDecoration(
          hint: 'Enter your password',
          suffixIcon: IconButton(
            onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
            icon: Icon(
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
              size: 20,
              color: _grayLabel,
            ),
            splashRadius: 20,
          ),
        ),
        validator: (value) =>
            (value == null || value.isEmpty) ? 'Password is required' : null,
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
          style: TextStyle(fontSize: 13.sp, color: _teal, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: Material(
        color: _teal,
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
              style: TextStyle(
                fontSize: 17.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signUpText() {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 14.sp, height: 1.2),
        children: [
          const TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(color: _grayLabel, fontWeight: FontWeight.w400),
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
                style: TextStyle(
                  color: _teal,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                ),
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 32.h),
                      SvgPicture.asset(
                        AppAssets.logoApp,
                        width: 120,
                      ),
                      SizedBox(height: 20.h),
                      const Text(
                        'Log In',
                        style: TextStyle(
                          fontFamily: FontFamilies.otama,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 36.h),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: _formWidth(context)),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _fieldLabel('Email'),
                              const SizedBox(height: 8),
                              _emailField(),
                              const SizedBox(height: 20),
                              _fieldLabel('Password'),
                              const SizedBox(height: 8),
                              _passwordField(),
                              const SizedBox(height: 12),
                              _forgotPassword(),
                              const SizedBox(height: 32),
                              _loginButton(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 48.h),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 28),
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
