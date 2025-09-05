import 'package:cryptoback_business_app/app_routes.dart';
import 'package:cryptoback_business_app/resources/assets.dart';
import 'package:cryptoback_business_app/utils/custom_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/enums.dart';
import '../notifier/constant_notifiers.dart';

class PassChangeScreen extends ConsumerWidget {
  static const String routeName = '/pass_change_screen';

  final String source;

  const PassChangeScreen({super.key, required this.source});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    {
      final role = ref.read(roleNotifier);
      // Determine the text based on source
      String getDisplayText() {
        if (source == 'signup') {
          return 'Profile Successfully\nCreated';
        } else {
          return 'Password Successfully Changed';
        }
      }

      return Scaffold(
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(
                  SvgAssets.blueTick,
                  width: 91.w,
                  height: 91.h,
                ),
              ),
              SizedBox(height: 24.w),
              if (role == Roles.shopper)
                Center(child: black25w500center(data: getDisplayText())),
              if (role == Roles.business)
                Center(
                  child: Column(
                    children: [
                      black25w500center(data: 'Successfully Signed Up'),
                      SizedBox(height: 24.w),
                      Text(
                        'Now Please Setup Your Business Profile',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF8D8D8D),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 50.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    role == Roles.business
                        ? Navigator.pushNamedAndRemoveUntil(
                            context,
                            businessStep,
                            (_) => false,
                          )
                        : Navigator.pushNamedAndRemoveUntil(
                            context,
                            shopprBottomNavBarRoute,
                            (_) => false,
                          );
                  },
                  child: Text('Next'),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
