import 'package:cryptoback_business_app/resources/assets.dart';
import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:cryptoback_business_app/utils/custom_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              alignment: Alignment.topLeft,
              height: 25.h,
              width: 25.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(DummyAssets.domino),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 7.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              black16w500center(data: 'Domino\'s Pizza'),
              SizedBox(height: 5.h),
              SizedBox(
                width: MediaQuery.of(context).size.width - 110.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    grey12w400Center(data: '10143 W Broad St'),
                    // Spacer(),
                    blue12w400Center(data: 'View'),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              black14w500center(data: '15% Cash Back'),
            ],
          ),
          // Spacer(),
          // blue12w400Center(data: 'View'),
        ],
      ),
    );
  }
}
