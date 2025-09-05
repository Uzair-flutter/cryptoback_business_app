import 'package:cryptoback_business_app/app_routes.dart';
import 'package:cryptoback_business_app/resources/assets.dart';
import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:cryptoback_business_app/utils/custom_font_style.dart';
import 'package:cryptoback_business_app/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../notifier/constant_notifiers.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 25.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100.h),
            Center(
              child: SvgPicture.asset(
                SvgAssets.logo,
                height: 132.h,
                width: 130.w,
              ),
            ),
            SizedBox(height: 35.h),
            white38w800Center(data: 'WELCOME TO\nBITCOIN BACK'),
            SizedBox(height: 27.h),
            white20w400Center(data: 'Lets Get Started'),
            Spacer(),
            Consumer(
              builder: (context, ref, child) {
                return Column(
                  children: [
                    roleButton('For Businesses', () {
                      ref.read(roleNotifier.notifier).state = Roles.business;
                      Navigator.pushNamed(context, loginRoute);
                    }),
                    SizedBox(height: 23.h),
                    roleButton('For Shoppers', () {
                      // ref.read(roleNotifier.notifier).state = Roles.shopper;
                      // Navigator.pushNamed(context, loginRoute);
                    }),
                  ],
                );
              },
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}

Widget roleButton(String text, VoidCallback onPressed) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.fieldfillColor,
        foregroundColor: AppColors.kPrimaryColor,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: blue24w500Center(data: text),
    ),
  );
}
