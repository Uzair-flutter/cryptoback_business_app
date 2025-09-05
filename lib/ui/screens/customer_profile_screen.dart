import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cryptoback_business_app/app_routes.dart';
import 'package:cryptoback_business_app/resources/assets.dart';
import 'package:cryptoback_business_app/ui/notifier/merchant_notifier.dart';
import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:cryptoback_business_app/ui/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

// Custom painter for hexagon pattern overlay

class CustomerProfileScreen extends ConsumerWidget {
  const CustomerProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final merchantState = ref.watch(merchantProvider);

    final merchantNotifier = ref.read(merchantProvider.notifier);

    final CarouselSliderController carouselController =
        CarouselSliderController();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),

        child: Column(
          children: [
            SizedBox(height: 60.h),
            SizedBox(height: 50.h),

            CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                height: 125.h,
                clipBehavior: Clip.none,
                viewportFraction: 0.85,

                enlargeCenterPage: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeFactor: 0.22,
                onPageChanged: (index, reason) {
                  merchantNotifier.updateCarouselIndex(index);
                },
              ),
              items: merchantState.merchantImages.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: 277.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(imagePath, fit: BoxFit.cover),
                      ),
                    );
                  },
                );
              }).toList(),
            ),

            SizedBox(height: 10.h),

            // Pagination Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(merchantState.merchantImages.length, (index) {
                  final isActive = index == merchantState.currentCarouselIndex;
                  return Container(
                    margin: EdgeInsets.only(right: 2.w),
                    width: isActive ? 23.w : 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: isActive
                          ? AppColors.kPrimaryColor
                          : const Color(0xFFDBE4FF),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  );
                }),
              ],
            ),
            SizedBox(height: 20.h),

            Container(
              height: 134.h,
              width: 343.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF3C70FF), Color(0xFF8FADFF)],
                ),
              ),
              child: Stack(
                children: [
                  // Geometric pattern overlay
                  Positioned.fill(
                    child: CustomPaint(painter: HexagonPatternPainter()),
                  ),
                  // Content
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                      bottom: 20.h,
                      left: 10.w,
                      right: 20.w,
                    ),
                    child: Row(
                      children: [
                        // Avatar with edit icon
                        Stack(
                          children: [
                            Container(
                              width: 94.w,
                              height: 94.w,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF6B6B),
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(DummyAssets.profile),
                            ),
                            // Edit icon
                            Positioned(
                              bottom: 0,
                              right: 6.w,
                              child: Container(
                                width: 20.w,
                                height: 20.w,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Iconsax.camera,
                                  color: const Color(0xFF3C70FF),
                                  size: 12.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10.w),
                        // Text information
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'John Doe',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                'John12doe@gmail.com',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
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
            ),
            SizedBox(height: 25.h),

            // Menu sections
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        ProfileCard(
                          percentage: "50%",
                          label: "QR Scans",
                          width: 108.w,
                          height: 67.h,
                        ),
                        SizedBox(width: 9.w),
                        ProfileCard(
                          percentage: "50%",
                          label: "Total Orders",
                          width: 108.w,
                          height: 67.h,
                        ),
                        SizedBox(width: 9.w),
                        ProfileCard(
                          percentage: "50%",
                          label: "QR Scans",
                          width: 108.w,
                          height: 67.h,
                        ),
                      ],
                    ),
                    SizedBox(height: 45.h),

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
                      icon: Iconsax.location,
                      title: 'e-Wallet',
                      onTap: () {
                        Navigator.pushNamed(context, eWalletRoute);
                      },
                    ),
                    _buildMenuItem(
                      icon: Iconsax.document_text,
                      title: 'Referral Program',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          businessReferralProgramView,
                        );
                      },
                    ),
                    _buildMenuItem(
                      icon: Iconsax.notification_bing,
                      title: 'Notification Settings',
                      onTap: () {
                        Navigator.pushNamed(context, businessNotificationView);
                      },
                    ),

                    SizedBox(height: 15.h),
                    Divider(thickness: 1, color: Colors.grey[300]),
                    SizedBox(height: 25.h),

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
                      onTap: () {},
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

                    SizedBox(height: 60.h),

                    // Logout
                    _buildMenuItem(
                      icon: Iconsax.logout_1,
                      title: 'Logout',
                      onTap: () {
                        Navigator.pushNamed(context, welcomeRoute);
                      },
                      isLogout: false,
                    ),

                    SizedBox(height: 120.h), // Space for bottom navigation
                  ],
                ),
              ),
            ),
            // Stats cards
          ],
        ),
      ),
    );
  }
}

Widget _buildMenuItem({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
  bool isLogout = false,
}) {
  return InkWell(
    onTap: onTap,

    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 4.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24.sp,
            color: isLogout ? Colors.red : Colors.blue[600],
          ),
          SizedBox(width: 16.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: isLogout ? Colors.red : Colors.black87,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Spacer(),
          Icon(Iconsax.arrow_right_3, size: 18.sp, color: Color(0xFFA4A4A4)),
        ],
      ),
    ),
  );
}

class HexagonPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.03)
      ..style = PaintingStyle.fill;

    final double hexSize = 12;
    final double hexWidth = hexSize * 2;
    final double hexHeight = hexSize * 1.732; // sqrt(3) * hexSize

    for (double y = 0; y < size.height + hexHeight; y += hexHeight * 0.9) {
      for (double x = 0; x < size.width + hexWidth; x += hexWidth * 0.9) {
        final path = Path();
        final centerX = x;
        final centerY = y;

        for (int i = 0; i < 6; i++) {
          final angle = i * 60 * 3.14159 / 180;
          final pointX = centerX + hexSize * cos(angle);
          final pointY = centerY + hexSize * sin(angle);

          if (i == 0) {
            path.moveTo(pointX, pointY);
          } else {
            path.lineTo(pointX, pointY);
          }
        }
        path.close();
        canvas.drawPath(path, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
