import 'package:animooo_app/core/constants/app_assets.dart';
import 'package:animooo_app/core/helpers/spacing.dart';
import 'package:animooo_app/core/theming/styles.dart';
import 'package:animooo_app/features/auth/presentation/widgets/signup_widgets/login_text.dart';
import 'package:animooo_app/features/auth/presentation/widgets/signup_widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    Center(
                      child: SvgPicture.asset(
                        AppAssets.logoApp,
                        width: 100.w,
                      ),
                    ),
                    Center(
                      child: Text(
                        'ANIMOOO',
                        style: AppTextStyles.font11MediumPrimary,
                      ),
                    ),
                    verticalSpace(20),
                    Text(
                      'Sign Up',
                      style: AppTextStyles.font34RegularBlack,
                    ),
                    verticalSpace(38),
                    const SignUpForm(),
                    verticalSpace(60),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 8.h,
                      ),
                      child: const LoginText(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
