import 'package:animooo_app/core/routing/routes.dart';
import 'package:animooo_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({super.key});

  @override
  Widget build(BuildContext context) {
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
                Navigator.pushNamed(context, Routes.signUp);
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
}
