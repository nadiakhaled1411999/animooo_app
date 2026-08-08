import 'package:animooo_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/font_family.dart';

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
      borderSide: color == null ? BorderSide.none : BorderSide(color: color, width: 1.2),
    );
  }

  InputDecoration _inputDecoration({
    required String hint,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(fontSize: 12.sp, color: const Color(0xFF6C6C6C), fontWeight: FontWeight.w400,fontFamily: FontFamilies.poppins),
      filled: true,
      fillColor: const Color(0xffEDEDED),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      enabledBorder: _border(),
      focusedBorder: _border(color: Color(0xff04332D)),
      errorBorder: _border(color: AppColors.appRed),
      focusedErrorBorder: _border(color: AppColors.appRed),
      suffixIcon: suffixIcon,
      errorStyle: TextStyle(fontSize: 12.sp, color: AppColors.appRed),
    );
  }

  Widget _fieldLabel(String label) {
    return Text(
      label,
      style: TextStyle(fontSize: 14.sp, color: const Color(0xff505050), fontWeight: FontWeight.w400,fontFamily: FontFamilies.poppins),
    );
  }

  Widget _emailField() {
    return SizedBox(
      height: 52.h,
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(fontSize: 10.sp, color: Colors.black),
        decoration: _inputDecoration(hint: 'Enter your email address'),
        validator: (value) =>
            (value == null || value.trim().isEmpty) ? 'Email is required' : null,
      ),
    );
  }

  Widget _passwordField() {
    return SizedBox(
      height: 52.h,
      child: TextFormField(
        controller: _passwordController,
        obscureText: _obscurePassword,
        style: TextStyle(fontSize: 10.sp, color: Colors.black),
        decoration: _inputDecoration(
          hint:"*********",
          suffixIcon: IconButton(
            onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
            icon: Icon(
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
              size: 20.sp,
              color: const Color(0xFF686F80),
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
          style: TextStyle(fontSize: 10.sp, color: const Color(0xFF04332D), fontWeight: FontWeight.w600,fontFamily: FontFamilies.poppins),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: Material(
        color: const Color(0xFF04332D),
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
                fontSize: 14.sp,
                color: Colors.white,
                fontFamily: FontFamilies.poppins,
                fontWeight: FontWeight.w400,
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
        style: TextStyle(fontSize: 12.sp, fontFamily: FontFamilies.poppins),
        children: [
          const TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(color:  Color(0xFF828282), fontWeight: FontWeight.w500, fontFamily: FontFamilies.poppins),
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
                  color: const Color(0xFF04332D),
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  fontFamily: FontFamilies.poppins,
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
                  padding:  EdgeInsets.symmetric(horizontal: 16.w),
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
                          style: TextStyle(
                            fontFamily: FontFamilies.poppins,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF04332D),
                          ),
                                               ),
                       ),
                      verticalSpace( 20),
                   Text(
                        'Log In',
                        style: TextStyle(
                          fontFamily: FontFamilies.otama,
                          fontSize: 34.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      verticalSpace( 40),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: _formWidth(context)),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _fieldLabel('Email'),
                              verticalSpace( 6),
                              _emailField(),
                             verticalSpace( 16),
                              _fieldLabel('Password'),
                              verticalSpace( 6),
                              _passwordField(),
                              verticalSpace( 12),
                              _forgotPassword(),
                              verticalSpace( 60),
                              _loginButton(),
                            ],
                          ),
                        ),
                      ),
                      verticalSpace( 150),
                      Padding(
                        padding:   EdgeInsets.only(bottom: 8.h),
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
