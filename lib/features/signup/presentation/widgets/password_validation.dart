import 'package:animooo_app/core/helpers/form_validators.dart';
import 'package:animooo_app/core/helpers/spacing.dart';
import 'package:animooo_app/core/theming/app_colors.dart';
import 'package:animooo_app/core/theming/styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Live password strength checklist.
///
/// Listens to the password field value through [password] and colors each
/// requirement green when satisfied and red otherwise. It only appears once
/// the user starts typing.
class PasswordValidation extends StatelessWidget {
  const PasswordValidation({
    super.key,
    required this.password,
  });

  final ValueListenable<String> password;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: password,
      builder: (context, value, _) {
        if (value.isEmpty) return const SizedBox.shrink();

        final requirements = FormValidators.passwordRequirements(value);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final requirement in requirements)
              Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: _RequirementRow(requirement: requirement),
              ),
          ],
        );
      },
    );
  }
}

class _RequirementRow extends StatelessWidget {
  const _RequirementRow({required this.requirement});

  final PasswordRequirement requirement;

  @override
  Widget build(BuildContext context) {
    final isValid = requirement.isValid;
    final color = isValid ? AppColors.green : AppColors.red;
    final style = isValid
        ? AppTextStyles.font10RegularGreen
        : AppTextStyles.font10RegularError;

    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle : Icons.cancel,
          size: 14.sp,
          color: color,
        ),
        horizontalSpace(6),
        Expanded(
          child: Text(
            requirement.label,
            style: style,
          ),
        ),
      ],
    );
  }
}
