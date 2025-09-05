import 'package:cryptoback_business_app/widgets/custom_app_bar_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class NotificationScreen extends StatelessWidget {
  static const String routeName = '/notificationScreen';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: 'Notifications', showActionButton: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: GestureDetector(
                      onTap: () {},
                      child: _buildNotificationCard(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 56.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4A4A4A).withOpacity(0.1),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF0246FF),
                      width: 0.49.w,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Iconsax.user,
                      size: 16.7.sp,
                      color: const Color(0xFF4A4A4A),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                // Text content
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Text(
                      'William Manager',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        height: 1.219,
                        color: const Color(0xFF1E1E1E),
                      ),
                    ),
                    SizedBox(height: 10.25.h),
                    // Message
                    SizedBox(
                      width: 249.w,
                      child: Text(
                        'It is a long established fact that a reader will be distracted',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.219,
                          color: const Color(0xFF1E1E1E),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Notification dot
                Container(
                  width: 12.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0246FF),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(height: 10.h),
                // Timestamp
                Text(
                  '2m',
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.182,
                    color: const Color(0xFF4A4A4A).withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 15.h),
        // Bottom divider line
        Container(height: 1.h, color: const Color(0xFF8DA5A2).withOpacity(0.3)),
      ],
    );
  }
}
