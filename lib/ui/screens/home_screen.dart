import 'package:cryptoback_business_app/app_routes.dart';
import 'package:cryptoback_business_app/resources/assets.dart';
import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:cryptoback_business_app/widgets/bottom_sheets/shop_list_bottom_sheet.dart';
import 'package:cryptoback_business_app/widgets/custom_blue_app_bar.dart';
import 'package:cryptoback_business_app/widgets/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomBlueAppBar(
        title: 'Current Location',
        onNotificationTap: () {
          Navigator.pushNamed(context, notificationRoute);
        },
      ),
      body: Stack(
        children: [
          Image.asset(PngAssets.map, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Iconsax.search_normal, size: 14.sp),
              ),
            ),
          ),
          Positioned(
            bottom: 125.h,
            right: 25.w,
            left: 25.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.strokeColor),
                  ),
                  child: Icon(
                    Iconsax.gps,
                    size: 24.sp,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
                SizedBox(height: 10.h),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                      ),
                      builder: (context) => const ShopListBottomSheet(),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      border: Border.all(color: AppColors.strokeColor),
                      borderRadius: BorderRadius.circular(52.r),
                    ),
                    child: Text('List View', style: TextStyle(fontSize: 10.sp)),
                  ),
                ),
                SizedBox(height: 10.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, merchantDetailRoute);
                  },
                  child: ShopCard(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
