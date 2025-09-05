import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
// keep your existing AppColors import

class TransactionTile extends StatelessWidget {
  final String imagePath;
  final String date;
  final String amount;
  final String description;
  final bool showDivider;

  const TransactionTile({
    super.key,
    required this.imagePath,
    required this.date,
    required this.amount,
    required this.description,
    this.showDivider = true, // divider optional
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image container
            Container(
              width: 56.w,
              height: 56.h,
              child: Center(child: Image.asset(imagePath)),
            ),
            SizedBox(width: 16.w),

            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyColor3,
                    ),
                  ),

                  // Cashback + description
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$amount ",
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greenColor,
                          ),
                        ),
                        TextSpan(
                          text: description,
                          style: GoogleFonts.montserrat(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyColor4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h),

        // Bottom divider line (optional)
        if (showDivider)
          Container(
            height: 1.h,
            color: const Color(0xFF8DA5A2).withOpacity(0.3),
          ),
      ],
    );
  }
}
