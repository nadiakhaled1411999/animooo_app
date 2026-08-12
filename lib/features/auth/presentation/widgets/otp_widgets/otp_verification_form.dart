import 'package:animooo_app/core/helpers/spacing.dart';
import 'package:animooo_app/core/theming/app_colors.dart';
import 'package:animooo_app/core/theming/styles.dart';
import 'package:animooo_app/core/widgets/custom_button.dart';
import 'package:animooo_app/features/auth/presentation/widgets/otp_widgets/resend_code_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationForm extends StatefulWidget {
  const OtpVerificationForm({super.key});

  @override
  State<OtpVerificationForm> createState() => _OtpVerificationFormState();
}

class _OtpVerificationFormState extends State<OtpVerificationForm> {
  final _otpController = TextEditingController();
  final _otpFocusNode = FocusNode();

  String? _errorText;

  @override
  void dispose() {
    _otpController.dispose();
    _otpFocusNode.dispose();
    super.dispose();
  }

  void _clearError() {
    if (_errorText != null) {
      setState(() => _errorText = null);
    }
  }

  void _onConfirmPressed() {
    if (_otpController.text.length != 4) {
      setState(() => _errorText = 'Please enter the 4 digit code');
    }
  }

  PinTheme _pinTheme({Color? borderColor}) {
    return PinTheme(
      width:55.w,
      height: 65.h,
      textStyle: AppTextStyles.font16RegularTextPrimary,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: borderColor ?? AppColors.inputBorder,
          width: 1.2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final maxWidth = (screenWidth * 0.85).clamp(280.0, 400.0);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Pinput(
            length: 5,
            controller: _otpController,
            focusNode: _otpFocusNode,
            autofocus: true,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            onChanged: (_) => _clearError(),
            onCompleted: (_) => _clearError(),
            onTap: _clearError,
            defaultPinTheme: _pinTheme(),
            focusedPinTheme: _pinTheme(
              borderColor: AppColors.primary,
            ),
            submittedPinTheme: _pinTheme(),
            followingPinTheme: _pinTheme(),
            disabledPinTheme: _pinTheme(),
            errorPinTheme: _pinTheme(
              borderColor: AppColors.red,
            ),
            errorText: _errorText,
            forceErrorState: _errorText != null,
            errorBuilder: (errorText, pin) => Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Text(
                errorText ?? '',
                style: AppTextStyles.font10RegularError,
              ),
            ),
          ),
          verticalSpace(45),
          CustomButton(
            label: 'Confirm',
            textStyle: AppTextStyles.font12RegularWhite,
            onPressed: _onConfirmPressed,
          ),
          verticalSpace(20),
          const SizedBox(
            width: double.infinity,
            child: ResendCodeTimer(),
          ),
        ],
      ),
    );
  }
}
