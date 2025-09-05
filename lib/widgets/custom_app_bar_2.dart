import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showActionButton;

  const CustomAppBar2({
    super.key,
    required this.title,

    this.showActionButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      leading: Center(
        child: GestureDetector(
          onTap: Navigator.of(context).pop,
          child: Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: AppColors.kPrimaryColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              Iconsax.arrow_left,
              color: AppColors.whiteColor,
              size: 14.sp,
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor,
        ),
      ),
      actions: showActionButton
          ? [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  size: 20.sp,
                  color: AppColors.blackColor,
                ),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
