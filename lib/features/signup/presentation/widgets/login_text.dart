import 'package:animooo_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Have an account already? ',
            style: AppTextStyles.font12MediumTextDisabled,
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Text(
                'Log in',
                style: AppTextStyles.font12MediumPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
