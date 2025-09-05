import 'package:cryptoback_business_app/app_routes.dart';
import 'package:cryptoback_business_app/resources/assets.dart';
import 'package:cryptoback_business_app/ui/notifier/auth_notifier.dart';
import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:cryptoback_business_app/utils/custom_font_style.dart';
import 'package:cryptoback_business_app/widgets/user_form_fields.dart';
import 'package:dropdown_button2/dropdown_button2.dart'; // Ensure this package is imported
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/enums.dart';
import '../notifier/constant_notifiers.dart';

class SignupScreen extends ConsumerWidget {
  static const String routeName = '/signup_screen';
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final authNotifier = ref.read(authProvider.notifier);
    final role = ref.read(roleNotifier);
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: role == Roles.business ? 70.h : 100.h),
              Center(
                child: SvgPicture.asset(
                  SvgAssets.logo2,
                  width: 186.w,
                  height: 63.h,
                ),
              ),
              SizedBox(height: role == Roles.business ? 35.h : 56.h),
              Center(child: black25w600center(data: 'Sign up')),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  grey12w500Center(data: "Already have an account?"),
                  SizedBox(width: 6.w),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: blue12w600Center(data: 'Login'),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              TextFormField(decoration: InputDecoration(hintText: 'Full Name')),
              if (role == Roles.business) SizedBox(height: 16.h),
              if (role == Roles.business)
                TextFormField(
                  decoration: InputDecoration(hintText: 'Business Name'),
                ),
              if (role == Roles.business) SizedBox(height: 16.h),
              if (role == Roles.business)
                Consumer(
                  builder: (context, ref, child) {
                    final state = ref.watch(authProvider);
                    return DropdownButton2<String>(
                      hint: Text(
                        'Business Niche',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Color(0xffB5B5B5),
                        ),
                      ),
                      value: state.businessNiche,
                      underline: SizedBox.shrink(),
                      items: _getDaysDropdownItems(),
                      onChanged: (value) {
                        ref
                            .read(authProvider.notifier)
                            .updateSelectedNiche(value);
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 50.h,
                        width: double.infinity, // Height of the dropdown button
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                        ), // Horizontal padding for the button
                        decoration: BoxDecoration(
                          color: AppColors
                              .fieldfillColor, // Background color for the button
                          borderRadius: BorderRadius.circular(14.r),
                          border: Border.all(
                            color: Color(0xffB5B5B5),
                          ), // Border color
                        ),
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200.h,
                        // Max height for the dropdown menu
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                        ), // Horizontal padding for dropdown items
                        decoration: BoxDecoration(
                          color: AppColors
                              .fieldfillColor, // Background color for the dropdown items
                          borderRadius: BorderRadius.circular(14.r),
                          border: Border.all(
                            color: Color(0xffB5B5B5),
                          ), // Border color
                        ),
                      ),
                      iconStyleData: IconStyleData(
                        icon: Icon(
                          Iconsax.arrow_down_1,
                          size: 20.sp,
                          color: Color(0xff292D32),
                        ),
                      ),
                    );
                  },
                ),

              SizedBox(height: 16.h),
              TextFormField(
                decoration: InputDecoration(
                  hintText: role == Roles.business ? 'Business Email' : 'Email',
                ),
              ),
              SizedBox(height: 16.h),

              // TextFormField(
              //   decoration: InputDecoration(
              //     hintText: 'Date of Birth',
              //     suffixIcon: Icon(Iconsax.calendar_1),
              //   ),
              // ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(hintText: 'Phone Number'),
              ),
              SizedBox(height: 16.h),
              PasswordFieldWidget(passwordController: TextEditingController()),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Transform.scale(
                    scale: 0.7,
                    child: Consumer(
                      builder: (context, ref, child) {
                        final state = ref.watch(
                          authProvider.select(
                            (state) => state.termsAndCondition,
                          ),
                        );
                        return Checkbox(
                          value: state,
                          onChanged: (_) =>
                              authNotifier.toggleTermsAndCondition(),
                          activeColor: AppColors.kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(5.r),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: grey12w500Center(
                      data:
                          "I accept the Terms & Conditions and Privacy Policy",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      otpRoute,
                      arguments: {'source': 'signup'},
                    );
                  },
                  child: Text('Sign Up'),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

List<DropdownMenuItem<String>> _getDaysDropdownItems() {
  final days = ['Food & Beverages', 'Clothing Brand', 'Fashion', 'Groceries'];

  return days.map((day) {
    return DropdownMenuItem<String>(
      value: day,
      child: Text(day, style: TextStyle(fontSize: 16.sp)),
    );
  }).toList();
}
