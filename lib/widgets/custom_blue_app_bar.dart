import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class CustomBlueAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showLeading;
  final bool showActions;
  final VoidCallback? onLocationTap;
  final VoidCallback? onSearchTap;
  final VoidCallback? onNotificationTap;

  const CustomBlueAppBar({
    super.key,
    required this.title,
    this.showLeading = true,
    this.showActions = true,
    this.onLocationTap,
    this.onSearchTap,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    // Determine if title should be centered
    final bool centerTitle = !showLeading && !showActions;

    return AppBar(
      backgroundColor: AppColors.kPrimaryColor,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      toolbarHeight: 80.h,
      centerTitle: centerTitle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      leading: showLeading
          ? Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Center(
                child: GestureDetector(
                  onTap: onLocationTap,
                  child: Container(
                    padding: EdgeInsets.all(6.2.r),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor.withValues(alpha: 0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Iconsax.location,
                      size: 17.5.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            )
          : null,
      title: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: showLeading
            ? Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Icon(
                    Iconsax.arrow_down_1,
                    color: AppColors.whiteColor,
                    size: 14.sp,
                  ),
                ],
              )
            : Text(
                title,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
      ),
      actions: showActions
          ? [
              Padding(
                padding: EdgeInsets.only(right: 10.w, top: 10.h),
                child: GestureDetector(
                  onTap: onSearchTap,
                  child: Container(
                    padding: EdgeInsets.all(6.2.r),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Iconsax.search_normal,
                      size: 17.5.sp,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 25.w, top: 10.h),
                child: GestureDetector(
                  onTap: onNotificationTap,
                  child: Container(
                    padding: EdgeInsets.all(6.2.r),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Iconsax.notification,
                      size: 17.5.sp,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
