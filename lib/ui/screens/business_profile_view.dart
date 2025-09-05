import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../app_routes.dart';
import '../../resources/assets.dart';

class BusinessProfileScreen extends ConsumerWidget {
  const BusinessProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          // Top Stack with background image and profile
          Stack(
            children: [
              // Background image container
              Container(
                height: 350.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(DummyAssets.mcdonald),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Profile information container
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 40.h),
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'John12doe@gmail.com',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Profile image positioned
              Positioned(
                bottom: 80.h,
                left: (1.sw - 80.w) / 2, // Center horizontally
                child: Stack(
                  children: [
                    Container(
                      width: 94.w,
                      height: 94.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2.w),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 10.r,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 38.r,
                        backgroundColor: Colors.pink,
                        // You can replace with actual image:
                        backgroundImage: AssetImage(DummyAssets.profile),
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      right: 1,
                      child: CircleAvatar(
                        radius: 12.r,
                        backgroundColor: Color(0xffFFFFFF),
                        child: Icon(
                          Iconsax.camera,
                          color: AppColors.kPrimaryColor,
                          size: 12.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Stats cards
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          //   child: Expanded(
          //     child:
          //   ),
          // ),
          // Menu sections
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      _buildStatCard('50%', 'QR Scans'),
                      SizedBox(width: 10.w),
                      _buildStatCard('50%', 'Total Orders'),
                      SizedBox(width: 10.w),
                      _buildStatCard('50%', 'QR Scans'),
                    ],
                  ),
                  SizedBox(height: 25.h),

                  // General section
                  Text(
                    'General',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  _buildMenuItem(
                    icon: Iconsax.user,
                    title: 'Personal Information',
                    onTap: () {
                      Navigator.pushNamed(context, personalInformationRoute);
                    },
                  ),
                  _buildMenuItem(
                    icon: Iconsax.document_text,
                    title: 'Referral Program',
                    onTap: () {
                      Navigator.pushNamed(context, businessReferralProgramView);
                    },
                  ),
                  _buildMenuItem(
                    icon: Iconsax.notification_bing,
                    title: 'Notification Settings',
                    onTap: () {
                      Navigator.pushNamed(context, businessNotificationView);
                    },
                  ),

                  SizedBox(height: 32.h),

                  // Help & Support section
                  Text(
                    'Help & Support',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  _buildMenuItem(
                    icon: Iconsax.info_circle,
                    title: 'About Us',
                    onTap: () {
                      Navigator.pushNamed(context, aboutUsRoute);
                    },
                  ),
                  _buildMenuItem(
                    icon: Iconsax.message_question,
                    title: 'Help Center',
                    onTap: () {
                      Navigator.pushNamed(context, helpCenterRoute);
                    },
                  ),
                  _buildMenuItem(
                    icon: Iconsax.support,
                    title: 'Support',
                    onTap: () {
                      // Navigator.pushNamed(context, supportRoute);
                    },
                  ),
                  _buildMenuItem(
                    icon: Iconsax.shield_tick,
                    title: 'Privacy Policy',
                    onTap: () {
                      Navigator.pushNamed(context, privacyPolicyRoute);
                    },
                  ),
                  _buildMenuItem(
                    icon: Iconsax.note_1,
                    title: 'Terms & Conditions',
                    onTap: () {
                      Navigator.pushNamed(context, termsAndConditionsRoute);
                    },
                  ),

                  SizedBox(height: 32.h),

                  // Logout
                  _buildMenuItem(
                    icon: Iconsax.logout_1,
                    title: 'Logout',
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        welcomeRoute,
                        (route) => false,
                      );
                    },
                    isLogout: false,
                  ),

                  SizedBox(height: 130.h), // Space for bottom navigation
                ],
              ),
            ),
          ),
          //  SizedBox(height: 40.h),
        ],
      ),

      // Bottom Navigation
    );
  }

  Widget _buildStatCard(String percentage, String label) {
    return Container(
      width: 105.67.h,
      height: 77.h,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Color(0xffEDF2FF),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.kPrimaryColor, width: 1.w),
      ),
      child: Column(
        children: [
          Text(
            percentage,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.kPrimaryColor,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(fontSize: 11.sp, color: AppColors.blackColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 4.w),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24.sp,
              color: isLogout ? Colors.red : Colors.blue[600],
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: isLogout ? Colors.red : Colors.black87,
                ),
              ),
            ),
            Icon(Iconsax.arrow_right_3, size: 20.sp, color: Color(0xFFA4A4A4)),
          ],
        ),
      ),
    );
  }
}
