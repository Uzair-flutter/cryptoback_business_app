import 'package:cryptoback_business_app/ui/screens/otp_Screen.dart';
import 'package:cryptoback_business_app/utils/custom_font_style.dart';
import 'package:cryptoback_business_app/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = '/forgotPass_screen';
  const ForgotPasswordScreen({super.key});

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
            Center(child: black25w500center(data: 'Forgot Password?')),
            SizedBox(height: 12.h),
            Center(
              child: grey12w500Center(
                data: 'Please enter your email to reset the password',
              ),
            ),
            SizedBox(height: 24.h),
            TextFormField(
              decoration: InputDecoration(hintText: 'Email/ Mobile Number'),
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    OtpScreen.routeName,
                    arguments: {'source': 'forgot_password'},
                  );
                },
                child: Text('Reset Password'),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
