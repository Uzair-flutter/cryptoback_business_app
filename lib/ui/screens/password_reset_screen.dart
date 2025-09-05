import 'package:cryptoback_business_app/app_routes.dart';
import 'package:cryptoback_business_app/utils/custom_font_style.dart';
import 'package:cryptoback_business_app/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class PasswordResetScreen extends StatelessWidget {
  static const String routeName = '/password_reset_screen';
  const PasswordResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            Center(child: black25w500center(data: 'Password reset')),
            SizedBox(height: 12.h),
            Center(
              child: grey12w500Center(
                data:
                    'Your password has been successfully reset. click\nconfirm to set a new password',
              ),
            ),

            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, setANewPassRoute);
                },
                child: Text('Confirm'),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
