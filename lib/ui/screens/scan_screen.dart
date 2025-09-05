import 'package:cryptoback_business_app/app_routes.dart';
import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:cryptoback_business_app/widgets/custom_blue_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ScanScreen extends StatelessWidget {
  static const String routeName = '/scan';
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomBlueAppBar(
        title: 'Scan QR Code Or Upload Receipt',
        showActions: false,
        showLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, scanQrCodeRoute);
              },
              child: Container(
                width: 255.w,
                height: 140.h,
                decoration: BoxDecoration(
                  color: AppColors.fieldfillColor,
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: AppColors.strokeColor, width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // QR Code Icon
                    Icon(
                      Icons.qr_code,
                      color: AppColors.kPrimaryColor,
                      size: 30.sp,
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Scan QR Code',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.lightBlackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 25.h),
          // Upload Receipt Button
          Center(
            child: Container(
              width: 255.w,
              height: 140.h,
              decoration: BoxDecoration(
                color: AppColors.fieldfillColor,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: AppColors.strokeColor, width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // QR Code Icon
                  Icon(
                    Iconsax.export_1,
                    color: AppColors.kPrimaryColor,
                    size: 30.sp,
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    'Upload Receipt',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: AppColors.lightBlackColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }
}
