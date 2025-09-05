import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCard extends StatelessWidget {
  final String percentage;
  final String label;
  final double height;
  final double width;

  const ProfileCard({
    super.key,
    required this.percentage,
    required this.label,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Color(0xFFEDF2FF), // Light blue background
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: AppColors.kPrimaryColor, // Light blue border
            width: 1.w,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Percentage text
            Text(
              percentage,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.kPrimaryColor, // Blue color for percentage
              ),
            ),
            SizedBox(height: 5.h),
            // Label text
            Text(
              label,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor, // Dark gray for label
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Example usage widget
