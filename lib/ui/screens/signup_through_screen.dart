import 'package:cryptoback_business_app/app_routes.dart';
import 'package:cryptoback_business_app/resources/assets.dart';
import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:cryptoback_business_app/utils/custom_font_style.dart';
import 'package:cryptoback_business_app/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpThroughScreen extends StatelessWidget {
  static const String routeName = '/signup_through_screen';
  const SignUpThroughScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        // height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.kPrimaryColor, Color(0xff8FADFF)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(SvgAssets.logo3, width: 186.w, height: 63.h),
            SizedBox(height: 50.h),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 25.w),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 24.h),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  black25w600center(data: 'Sign up through'),
                  SizedBox(height: 24.h),
                  SocialButton(
                    text: 'Continue with Google',
                    iconPath: SvgAssets.google,
                    onPressed: () {},
                  ),
                  SizedBox(height: 15.h),
                  SocialButton(
                    text: 'Continue with Apple',
                    iconPath: SvgAssets.apple,
                    onPressed: () {},
                  ),
                  SizedBox(height: 15.h),
                  SocialButton(
                    text: 'Continue with Facebook',
                    iconPath: SvgAssets.facebook,
                    onPressed: () {},
                  ),
                  SizedBox(height: 15.h),
                  SocialButton(
                    text: 'Continue with Email',
                    iconPath: SvgAssets.email,
                    onPressed: () {
                      Navigator.pushNamed(context, signupRoute);
                    },
                  ),
                  SizedBox(height: 24.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          loginRoute,
                          (_) => false,
                        );
                      },
                      child: blue12w600Center(data: 'Login to Your Account'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
