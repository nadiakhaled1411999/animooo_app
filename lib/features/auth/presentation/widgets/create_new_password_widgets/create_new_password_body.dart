import 'package:animooo_app/core/helpers/spacing.dart';
import 'package:animooo_app/core/theming/styles.dart';
import 'package:animooo_app/core/widgets/custom_back_button.dart';
import 'package:animooo_app/features/auth/presentation/widgets/create_new_password_widgets/create_new_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewPasswordBody extends StatelessWidget {
  const CreateNewPasswordBody({super.key});

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(24),
                    const CustomBackButton(
                      label: 'Cancel',
                      icon: Icons.arrow_back_ios_new,
                    ),
                    verticalSpace(32),
                    Text(
                      'Create New Password',
                      style: AppTextStyles.font20RegularPrimary,
                    ),
                    verticalSpace(24),
                    const CreateNewPasswordForm(),
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
