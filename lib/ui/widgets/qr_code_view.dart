import 'package:cryptoback_business_app/resources/assets.dart';
import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app_routes.dart';

class QrCodeView extends ConsumerWidget {
  const QrCodeView({super.key});

  @override
  Widget build(BuildContext context, watchRef) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 140.h),
            // Title
            Text(
              'Here’s Your QR Code',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1F2937),
                height: 1.3,
              ),
            ),
            SizedBox(height: 20.h),
            SvgPicture.asset(DummyAssets.qrCode, width: 267.w, height: 239.h),
            SizedBox(height: 30.h),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                maximumSize: WidgetStatePropertyAll(Size(267.w, 40.h)),
                minimumSize: WidgetStatePropertyAll(Size(267.w, 40.h)),
              ),
              child: Text(
                "Download QR Code",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle "Share QR Code" button tap
                  },
                  child: Container(
                    width: 128.5.w, // Adjust width based on screen size
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.white, // White background
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: AppColors.kPrimaryColor,
                      ), // Blue border
                    ),
                    child: Center(
                      child: Text(
                        "Share QR Code",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.kPrimaryColor, // Blue text color
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w), // Spacing between buttons
                GestureDetector(
                  onTap: () {
                    // Handle "Print QR Code" button tap
                  },
                  child: Container(
                    width: 128.5.w, // Adjust width based on screen size
                    height: 40.h, // Adjust height based on screen size
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor, // Blue background
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: AppColors.kPrimaryColor,
                      ), // Blue border
                    ),
                    child: Center(
                      child: Text(
                        "Print QR Code",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white, // White text color
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, businessBottomNavBBarRoute);
                    },
                    child: Text("Done"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
