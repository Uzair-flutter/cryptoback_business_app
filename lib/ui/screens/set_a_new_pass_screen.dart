import 'package:cryptoback_business_app/app_routes.dart';
import 'package:cryptoback_business_app/ui/notifier/auth_notifier.dart';
import 'package:cryptoback_business_app/utils/custom_font_style.dart';
import 'package:cryptoback_business_app/widgets/back_button.dart';
import 'package:cryptoback_business_app/widgets/user_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetANewPassScreen extends ConsumerWidget {
  static const String routeName = '/set_a_new_pass_screen';
  const SetANewPassScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);

    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 25.w),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            const CustomBackButton(),
            Spacer(),
            Center(child: black25w500center(data: 'Set a new password')),
            SizedBox(height: 12.h),
            Center(
              child: grey12w500Center(
                data:
                    'Create a new password. Ensure it differs from previous ones for security',
              ),
            ),
            SizedBox(height: 24.h),
            PasswordFieldWidget(
              hintText: 'Enter your new password',
              passwordController: authNotifier.newPassController,
            ),
            SizedBox(height: 24.h),
            PasswordFieldWidget(
              hintText: 'Re-enter password',
              passwordController: authNotifier.confirmPassController,
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    passChangeRoute,
                    arguments: {'source': 'password_reset'},
                  );
                },
                child: Text('Update Password'),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
