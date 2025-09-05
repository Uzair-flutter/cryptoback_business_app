import 'package:cryptoback_business_app/ui/themes/color_constants.dart'; // Replace with your actual color import
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CampaignTile extends StatelessWidget {
  final String? title;
  final String? type;
  final String? date;
  final String? amount;
  final String? id;
  final bool isActive;

  const CampaignTile({
    super.key,
    this.title,
    this.type,
    this.date,
    this.amount,
    this.id,
    this.isActive = true, // Default to true if not provided
  });

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar with initials
          Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: Color(0xFFE9E9E9),
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.kPrimaryColor, width: 1.w),
            ),
            child: Center(
              child: Text(
                'JD',
                // title != null
                //     ? title![0]
                //     : 'JD', // Dynamically use the first letter of the title
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),

          // Campaign details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Campaign type tag
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 3.h,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFEF4E8),
                        borderRadius: BorderRadius.circular(43.r),
                      ),
                      child: Text(
                        type ??
                            'N/A', // Default to 'N/A' if type is not provided
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFF18E19),
                        ),
                      ),
                    ),

                    Icon(
                      Icons.more_horiz,
                      color: AppColors.blackColor2,
                      size: 20.sp,
                    ),
                  ],
                ),
                SizedBox(height: 5.h),

                // Campaign title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ??
                          'Default Title', // Default value if title is null
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF212121),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: isActive ? Color(0xFFE8F5E8) : Color(0xFFFCE4EC),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        isActive ? 'Active' : 'Expired', // Dynamic value
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: isActive
                              ? Color(0xFF129E00)
                              : AppColors.redColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),

                // Date and ID row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date ??
                          '26 Apr 2025, 09:00 am', // Default value if date is null
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF757575),
                      ),
                    ),
                    Text(
                      'ID: ${id ?? 'N/A'}', // Default value if ID is null
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
