import 'package:cryptoback_business_app/app_routes.dart';
import 'package:cryptoback_business_app/resources/assets.dart';
import 'package:cryptoback_business_app/ui/screens/shopper_bottom_nav.dart';
import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ReceiptSentScreen extends ConsumerWidget {
  static const String routeName = '/receiptSent';
  const ReceiptSentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 25.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                SvgAssets.blueTick,
                width: 91.w,
                height: 91.h,
              ),
            ),
            SizedBox(height: 24.w),
            Center(
              child: Text(
                'Your Receipt has been sent to the Business Owner for Verification',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.lightBlackColor,
                ),
              ),
            ),
            SizedBox(height: 30.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ref.read(shopperBottomNavIndexProvider.notifier).state = 2;
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    shopprBottomNavBarRoute,
                    (route) => route.settings.name == welcomeRoute,
                  );
                },
                child: Text('Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
