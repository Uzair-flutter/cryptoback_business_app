import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:cryptoback_business_app/utils/custom_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NewCampaignBottomSheet extends StatelessWidget {
  const NewCampaignBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.h,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            // Drag Handle
            Container(
              width: 60.w,
              height: 6.h,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 30.h),
            // Header
            black22w600center(data: 'New Campaign'),
            SizedBox(height: 20.h),

            // Campaign Details Card
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 12.h),
                  padding: EdgeInsets.all(14.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
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
                          border: Border.all(
                            color: AppColors.kPrimaryColor,
                            width: 1.w,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'JD',
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
                                    "Percentage",
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFF18E19),
                                    ),
                                  ),
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
                                  "Black Friday Sale",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF212121),
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
                                  '26 Apr 2025, 09:00 am,',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF757575),
                                  ),
                                ),
                                Text(
                                  'ID: 14545782',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Action Buttons
            Row(
              children: [
                // Make it Live Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Handle make it live action
                    },

                    child: Text('Make it Live'),
                  ),
                ),

                SizedBox(width: 16.w),

                // Save as Draft Button
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Handle save as draft action
                    },

                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.secondaryColor,
                      side: const BorderSide(
                        color: AppColors.secondaryColor,
                        width: 1.5,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'Save as draft',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Helper function to show the bottom sheet
void showNewCampaignBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const NewCampaignBottomSheet(),
  );
}
