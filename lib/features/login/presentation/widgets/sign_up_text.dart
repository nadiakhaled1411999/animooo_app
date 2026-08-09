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
}
