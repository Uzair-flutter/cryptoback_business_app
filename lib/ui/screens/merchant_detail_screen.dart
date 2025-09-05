import 'package:cryptoback_business_app/resources/assets.dart';
import 'package:cryptoback_business_app/ui/notifier/merchant_notifier.dart';
import 'package:cryptoback_business_app/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../themes/color_constants.dart';

class MerchantDetailScreen extends ConsumerWidget {
  static const String routeName = '/merchantDetail';
  const MerchantDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final merchantState = ref.watch(merchantProvider);
    final merchantNotifier = ref.read(merchantProvider.notifier);

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Background Image
            Container(
              height: 323.h,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(DummyAssets.mcdonald),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // App Bar with Back Button
            Positioned(
              top: 40.h,
              left: 25.w,
              child: CustomBackButton(color: AppColors.blackColor3),
            ),

            // Main Content Card
            Positioned(
              top: 270.h,
              bottom: 0.h,
              left: 0,
              right: 0,
              child: Container(
                // width: 393.w,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    // Action Buttons Row
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 25.w),
                      child: Row(
                        children: [
                          _buildActionButton(
                            icon: Iconsax.discount_shape,
                            label: 'Offers',
                            isActive: merchantState.selectedTab == 'Offers',

                            onTap: () =>
                                merchantNotifier.updateSelectedTab('Offers'),
                          ),
                          SizedBox(width: 10.w),
                          _buildActionButton(
                            icon: Iconsax.info_circle,
                            label: 'Information',
                            isActive:
                                merchantState.selectedTab == 'Information',
                            onTap: () => merchantNotifier.updateSelectedTab(
                              'Information',
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 25.h),

                    // Tab Content
                    Expanded(
                      child: merchantState.selectedTab == 'Offers'
                          ? _buildOffersTab()
                          : _buildInformationTab(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isActive ? AppColors.kPrimaryColor : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(50.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 14,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? AppColors.whiteColor : AppColors.blackColor,
              size: 16.sp,
            ),
            SizedBox(width: 5.w),
            Text(
              label,
              style: TextStyle(
                color: isActive
                    ? AppColors.whiteColor
                    : AppColors.lightBlackColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOffersTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 25.w),
            child: _buildMerchantInfo(),
          ),

          SizedBox(height: 25.h),

          // Offers Section
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 25.w),
            child: Text(
              'All Offers',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.lightBlackColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          SizedBox(height: 15.h),

          // Offers List
          ...List.generate(
            4,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: 15, left: 25.w, right: 25.w),
              child: _buildOfferCard(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInformationTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 25.w),
            child: _buildMerchantInfo(),
          ),

          SizedBox(height: 25.h),

          // Details Section
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 25.w),
            child: Text(
              'Details',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.lightBlackColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          SizedBox(height: 25.h),

          // Phone Number
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 25.w),
            child: _buildInfoRow(
              icon: Iconsax.call5,
              label: 'Phone Number',
              value: '(+145) 1236 6987 7412',
            ),
          ),

          SizedBox(height: 25.h),

          // Divider
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 25.w),
            child: Divider(color: Color(0xffCCCCCC), height: 1),
          ),

          SizedBox(height: 25.h),

          // Hours
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 25.w),
            child: _buildHoursRow(),
          ),

          SizedBox(height: 25.h),

          // Divider
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 25.w),
            child: Divider(color: Color(0xffCCCCCC), height: 1),
          ),

          SizedBox(height: 25.h),

          // Address Section
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 25.w),
            child: Text(
              'Address',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.lightBlackColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          SizedBox(height: 25.h),

          // Address with Map
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 25.w),
            child: _buildAddressSection(),
          ),

          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  Widget _buildMerchantInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title and Heart
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "McDonald's",
              style: TextStyle(
                color: AppColors.lightBlackColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(Iconsax.heart, color: AppColors.greyColor2, size: 18.sp),
          ],
        ),

        SizedBox(height: 10.h),

        // Rating and Location
        Row(
          children: [
            // Rating
            Row(
              children: List.generate(
                5,
                (index) =>
                    Icon(Icons.star, color: Color(0xFFF18E19), size: 16.sp),
              ),
            ),
            SizedBox(width: 5.w),
            Text(
              '4.9 (5757)',
              style: TextStyle(
                color: AppColors.blackColor3,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),

            SizedBox(width: 8.w),

            // Divider
            Container(
              width: 7.77.w,
              height: 2.16.h,
              color: AppColors.greyColor2,
            ),

            SizedBox(width: 8.w),

            // Location
            Icon(
              Iconsax.location5,
              color: AppColors.kPrimaryColor,
              size: 16.sp,
            ),
            SizedBox(width: 5.w),
            Text(
              '3.4 km',
              style: TextStyle(
                color: AppColors.blackColor3,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat',
              ),
            ),
          ],
        ),

        SizedBox(height: 10.h),

        // Category
        Text(
          'Food & Beverages',
          style: TextStyle(
            color: AppColors.greyColor2,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildOfferCard() {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 30,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Up To 30% Cash Back',
                  style: TextStyle(
                    color: AppColors.lightBlackColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 14.h),
                Text(
                  'McChicken Burger + Drink (Reg) in Just \$5.00',
                  style: TextStyle(
                    color: AppColors.greyColor2,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 14.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                  child: Text(
                    'In Store',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 5.w),

          // Right Discount Badge
          Container(
            width: 134.w,
            height: 104.h,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppColors.kPrimaryColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              children: [
                Text(
                  'Flat',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '50%',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Cash Back',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.kPrimaryColor, size: 16.sp),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: AppColors.greyColor2,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              value,
              style: TextStyle(
                color: AppColors.lightBlackColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHoursRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header row with icon and "Hours" label
        Row(
          children: [
            Icon(Iconsax.call5, color: AppColors.kPrimaryColor, size: 14.sp),
            SizedBox(width: 10.w),
            Text(
              'Hours',
              style: TextStyle(
                color: AppColors.greyColor2,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),

        SizedBox(height: 10.h),

        // Hours display row
        Consumer(
          builder: (context, ref, child) {
            final merchantState = ref.watch(merchantProvider);
            final merchantNotifier = ref.read(merchantProvider.notifier);

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left side with invisible icon and hours text
                Row(
                  children: [
                    Icon(
                      Iconsax.call5,
                      color: AppColors.kPrimaryColor.withValues(alpha: 0.0),
                      size: 16.sp,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Thursday | 11:00 AM - 12:00 PM',
                      style: TextStyle(
                        color: AppColors.lightBlackColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                // Right side with arrow icon
                GestureDetector(
                  onTap: () => merchantNotifier.toggleHoursExpansion(),
                  child: AnimatedRotation(
                    turns: merchantState.isHoursExpanded ? 0.5 : 0.0,
                    duration: Duration(milliseconds: 300),
                    child: Icon(
                      Iconsax.arrow_down_1,
                      color: AppColors.blackColor,
                      size: 16.sp,
                    ),
                  ),
                ),
              ],
            );
          },
        ),

        // Expanded Hours Section
        Consumer(
          builder: (context, ref, child) {
            final merchantState = ref.watch(merchantProvider);

            return AnimatedCrossFade(
              firstChild: SizedBox.shrink(),
              secondChild: Column(
                children: [
                  SizedBox(height: 5.h),
                  _buildExpandedHours(),
                ],
              ),
              crossFadeState: merchantState.isHoursExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 300),
            );
          },
        ),
      ],
    );
  }

  Widget _buildExpandedHours() {
    final weekDays = [
      {'day': 'Monday', 'hours': '9:00 AM - 10:00 PM'},
      {'day': 'Tuesday', 'hours': '9:00 AM - 10:00 PM'},
      {'day': 'Wednesday', 'hours': '9:00 AM - 10:00 PM'},
      {'day': 'Thursday', 'hours': '11:00 AM - 12:00 PM'},
      {'day': 'Friday', 'hours': '9:00 AM - 11:00 PM'},
      {'day': 'Saturday', 'hours': '10:00 AM - 11:00 PM'},
      {'day': 'Sunday', 'hours': '10:00 AM - 9:00 PM'},
    ];

    return Column(
      children: weekDays.map((dayInfo) {
        return Padding(
          padding: EdgeInsets.only(bottom: 7.h, left: 25.w),
          child: Row(
            children: [
              Text(
                '${dayInfo['day']} | ${dayInfo['hours']}',
                style: TextStyle(
                  color: AppColors.lightBlackColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildAddressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Iconsax.location5,
              color: AppColors.kPrimaryColor,
              size: 16.sp,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                '10143 W Broad Street, Lane 04, NewYork.',
                style: TextStyle(
                  color: AppColors.greyColor2,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Container(
          height: 223.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              image: AssetImage(PngAssets.map),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
