import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../themes/color_constants.dart';

class UploadLogoView extends StatelessWidget {
  const UploadLogoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        // Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            'Upload Business Logo',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1F2937),
              height: 1.3,
            ),
          ),
        ),
        SizedBox(height: 32.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Container(
            height: 150.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFFAFAFAF), width: 1.w),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Iconsax.export_1,
                    color: AppColors.kPrimaryColor,
                    size: 32.w,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Upload Image',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
