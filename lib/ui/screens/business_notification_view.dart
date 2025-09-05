import 'package:cryptoback_business_app/widgets/custom_app_bar_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../notifier/business_notification_notifier.dart';
import '../themes/color_constants.dart';

class BusinessNotificationView extends ConsumerWidget {
  const BusinessNotificationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationState = ref.watch(businessNotificationProvider);
    final notificationNotifier = ref.read(
      businessNotificationProvider.notifier,
    );

    return Scaffold(
      appBar: CustomAppBar2(
        title: "Notification Settings",
        showActionButton: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25.h),
            Text(
              'General',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 18.h),
            Material(
              elevation: 5,
              shadowColor: Colors.black.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10.r),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 10.h,
                ),
                leading: Container(
                  height: 44.h,
                  width: 44.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFEDF2FF),
                  ),
                  child: Icon(
                    Iconsax.notification_bing,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
                title: Text(
                  'Push Notifications',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.listTileTextBlackColor,
                  ),
                ),
                trailing: Transform.scale(
                  scale: 0.9,
                  child: Switch(
                    value: notificationState.pushNotifications,
                    onChanged: (value) =>
                        notificationNotifier.togglePushNotifications(value),
                    activeThumbColor: AppColors.whiteColor,
                    activeTrackColor: Color(0xFF39FF14),
                  ),
                ),
                tileColor: Colors.white,
                splashColor: AppColors.lightGreyColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                subtitle: null,
              ),
            ),
            SizedBox(height: 25.h),
            Divider(),
            SizedBox(height: 15.h),
            Text(
              'Sound',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 18.h),
            Material(
              elevation: 5,
              shadowColor: Colors.black.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10.r),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 10.h,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Vibrations',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.listTileTextBlackColor,
                      ),
                    ),
                    Transform.scale(
                      scale: 0.9,
                      child: Switch(
                        value: notificationState.vibrations,
                        onChanged: (value) =>
                            notificationNotifier.toggleVibrations(value),
                        activeThumbColor: AppColors.whiteColor,
                        activeTrackColor: Color(0xFF39FF14),
                      ),
                    ),
                  ],
                ),
                tileColor: Colors.white,
                splashColor: AppColors.lightGreyColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                subtitle: Text(
                  'When vibrate Notifications are on. your phone will vibrate,',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.listTileTextBlackColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 18.h),
            Material(
              elevation: 5,
              shadowColor: Colors.black.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10.r),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 10.h,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sounds',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.listTileTextBlackColor,
                      ),
                    ),
                    Transform.scale(
                      scale: 0.9,
                      child: Switch(
                        value: notificationState.sounds,
                        onChanged: (value) =>
                            notificationNotifier.toggleSounds(value),
                        activeThumbColor: AppColors.whiteColor,
                        activeTrackColor: Color(0xFF39FF14),
                      ),
                    ),
                  ],
                ),
                tileColor: Colors.white,
                splashColor: AppColors.lightGreyColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                subtitle: Text(
                  'When sound Notifications are on. your phone will make sound,',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.listTileTextBlackColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
