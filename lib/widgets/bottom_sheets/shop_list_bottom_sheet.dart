// ignore_for_file: deprecated_member_use

import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:cryptoback_business_app/widgets/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopListBottomSheet extends StatelessWidget {
  const ShopListBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 433.h,

      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 14,
            spreadRadius: 0,
            offset: const Offset(0, 6),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 25,
            spreadRadius: 0,
            offset: const Offset(0, 25),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 34,
            spreadRadius: 0,
            offset: const Offset(0, 56),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.01),
            blurRadius: 40,
            spreadRadius: 0,
            offset: const Offset(0, 100),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.0),
            blurRadius: 44,
            spreadRadius: 0,
            offset: const Offset(0, 157),
          ),
        ],
      ),
      child: Column(
        children: [
          // Drag handle
          Container(
            margin: EdgeInsets.only(top: 15.h),
            width: 62.64.w,
            height: 4.27.h,
            decoration: BoxDecoration(
              color: AppColors.dragHandleColor,
              borderRadius: BorderRadius.circular(80.r),
            ),
          ),
          SizedBox(height: 12.h),
          Expanded(
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.only(
                left: 15.w,
                right: 15.w,
                top: 13.h,
                bottom: 25.h,
              ),

              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: ShopCard(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
