import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CustomBackButton extends StatelessWidget {
  final Color color;
  const CustomBackButton({super.key, this.color = AppColors.kPrimaryColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Icon(
          Iconsax.arrow_left,
          color: AppColors.whiteColor,
          size: 14.sp,
        ),
      ),
    );
  }
}
