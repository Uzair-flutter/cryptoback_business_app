import 'package:cryptoback_business_app/app_routes.dart';
import 'package:cryptoback_business_app/resources/assets.dart';
import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:cryptoback_business_app/utils/responsive.dart';
import 'package:cryptoback_business_app/widgets/custom_blue_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ScanQrCode extends StatelessWidget {
  static const String routeName = '/scan_qr_code';
  const ScanQrCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBlueAppBar(
        title: 'Scan QR Code',
        showLeading: false,
        showActions: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Center(
              child: Container(
                height: 239.h,
                width: Responsive.getResponsiveDesign(
                  mobile: () => 267.w,
                  smallTablet: () => 280.w,
                  tablet: () => 320.w,
                )!,
                decoration: BoxDecoration(
                  color: AppColors.kPrimaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: AppColors.kPrimaryColor),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Scan The QR Code',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.lightBlackColor,
              ),
            ),
            SizedBox(height: 9.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(SvgAssets.check, width: 20.w, height: 20.h),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    'Position all 4 corners of the QR Code in the frame',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.lightBlackColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(SvgAssets.check, width: 20.w),
                SizedBox(width: 9.w),
                Expanded(
                  child: Text(
                    'Take a clear and in-focus photo.',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.lightBlackColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(SvgAssets.check, width: 20.w),
                SizedBox(width: 9.w),
                Expanded(
                  child: Text(
                    'Try to avoid glare, don’t use flash.',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.lightBlackColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(SvgAssets.check, width: 20.w),
                SizedBox(width: 9.w),
                Expanded(
                  child: Text(
                    'Utilize good lighting.',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.lightBlackColor,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Start QR scanning process
                  // controller.openScanner();
                  Navigator.pushNamed(context, cameraRoute);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Scan QR Code.'),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
