import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReferralListTile extends StatelessWidget {
  final String name;
  final String referralDate;
  final String initials;

  const ReferralListTile({
    super.key,
    required this.name,
    required this.referralDate,
    required this.initials,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar with initials
          Container(
            width: 25.h,
            height: 25.w,
            decoration: BoxDecoration(
              color: Color(0xFFE9E9E9), // Light blue background
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xFF2196F3), // Blue border
                width: 1.5,
              ),
            ),
            child: Center(
              child: Text(
                initials,
                style: TextStyle(
                  color: AppColors.kPrimaryColor, // Blue text
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          // Name and referral info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.listTileTextBlackColor,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Successfully Referred On $referralDate',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.greyColor2,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
