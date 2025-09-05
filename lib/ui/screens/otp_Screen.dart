import 'package:cryptoback_business_app/app_routes.dart';
import 'package:cryptoback_business_app/ui/notifier/auth_notifier.dart';
import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:cryptoback_business_app/utils/custom_font_style.dart';
import 'package:cryptoback_business_app/utils/responsive.dart';
import 'package:cryptoback_business_app/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends ConsumerWidget {
  static const String routeName = '/otp_screen';

  final String source; // 'signup' or 'forgot_password'

  const OtpScreen({super.key, required this.source});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);
    final authState = ref.watch(authProvider);

    // Determine which route to navigate to based on source
    String getNextRoute() {
      if (source == 'signup') {
        return passChangeRoute;
      } else if (source == 'forgot_password') {
        return passwordResetRoute;
      }
      return passwordResetRoute; // default fallback
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 25.w),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            const CustomBackButton(),
            Spacer(),
            Center(child: black25w500center(data: 'Enter OTP')),
            SizedBox(height: 12.h),
            Center(
              child: grey12w500Center(
                data:
                    'We sent a reset link to abc123@gmail.com\nenter 5 digit code that mentioned in the email',
              ),
            ),
            SizedBox(height: 24.h),
            Pinput(
              mainAxisAlignment: Responsive.getResponsiveDesign(
                mobile: () => MainAxisAlignment.spaceBetween,
                smallTablet: () => MainAxisAlignment.spaceEvenly,
                tablet: () => MainAxisAlignment.spaceEvenly,
              )!,
              controller: authNotifier.otpController,
              length: 5,
              defaultPinTheme: PinTheme(
                width: 55.w,
                height: 53.h,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.strokeColor),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                textStyle: TextStyle(fontSize: 16.sp),
              ),
              focusedPinTheme: PinTheme(
                width: 55.w,
                height: 53.h,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.kPrimaryColor),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                textStyle: TextStyle(fontSize: 16.sp),
              ),
              submittedPinTheme: PinTheme(
                width: 55.w,
                height: 53.h,
                decoration: BoxDecoration(
                  color: AppColors.kPrimaryColor.withOpacity(0.1),
                  border: Border.all(color: AppColors.kPrimaryColor),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                textStyle: TextStyle(fontSize: 16.sp),
              ),
              onChanged: (pin) {
                authNotifier.handleOtpChange(pin);
              },
              onCompleted: (pin) {
                authNotifier.handleOtpCompletion(pin);
              },
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: authState.isOtpValid
                    ? () {
                        Navigator.pushNamed(
                          context,
                          getNextRoute(),
                          arguments: {'source': source},
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: authState.isOtpValid
                      ? AppColors.kPrimaryColor
                      : AppColors.kPrimaryColor.withOpacity(0.3),
                  disabledBackgroundColor: AppColors.kPrimaryColor.withOpacity(
                    0.3,
                  ),
                  disabledForegroundColor: Colors.white.withOpacity(0.6),
                  elevation: authState.isOtpValid ? 2 : 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  'Verify Code',
                  style: TextStyle(
                    color: authState.isOtpValid
                        ? Colors.white
                        : Colors.white.withOpacity(0.6),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            SizedBox(height: 24.h),
            RichText(
              text: TextSpan(
                text: "Haven't got the OTP yet? ",
                style: TextStyle(color: AppColors.blackColor3, fontSize: 14.sp),
                children: [
                  TextSpan(
                    text: 'Resend OTP',
                    style: TextStyle(
                      color: AppColors.kPrimaryColor,
                      fontSize: 14.sp,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
