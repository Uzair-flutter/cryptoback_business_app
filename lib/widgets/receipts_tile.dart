import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../ui/themes/color_constants.dart';

class ReceiptsTile extends StatelessWidget {
  final String? title;
  final String? date;
  final String? amount;

  const ReceiptsTile({super.key, this.title, this.date, this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? 'John Doe', // default value if title is null
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.listTileTextBlackColor,
                ),
              ),
              SizedBox(height: 7.h),
              Text(
                date ??
                    '26 Apr 2025, 09:00 am', // default value if date is null
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6B7280),
                ),
              ),
              SizedBox(height: 7.h),
              Text(
                'Total: ${amount ?? '\$20.00'}', // default value if amount is null
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.listTileTextBlackColor,
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(Iconsax.arrow_right_3, size: 20.sp, color: Color(0xFF292D32)),
        ],
      ),
    );
  }
}
