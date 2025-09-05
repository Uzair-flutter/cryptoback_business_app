import 'package:cryptoback_business_app/resources/assets.dart';
import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:cryptoback_business_app/widgets/custom_app_bar_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../notifier/constant_notifiers.dart';

class PersonalInformation extends ConsumerWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final role = ref.read(roleNotifier);

    return Scaffold(
      appBar: CustomAppBar2(
        title: "Personal Information",
        showActionButton: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Center(
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
                            color: Colors.black.withOpacity(0.1),
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
              SizedBox(height: 25.h),
              TextFormField(
                decoration: InputDecoration(hint: Text("John Deo")),
              ),
              SizedBox(height: 25.h),
              TextFormField(
                decoration: InputDecoration(hint: Text("John12doe@gmail.com")),
              ),
              SizedBox(height: 25.h),
              TextFormField(
                decoration: InputDecoration(hint: Text("+1 1254 7896 9512")),
              ),
              SizedBox(height: 25.h),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Change Password"),

                            Icon(Iconsax.arrow_right_3),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Spacer(),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 25.w, vertical: 20.h),
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: AppColors.kPrimaryColor, width: 1.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 0),
            minimumSize: Size(double.infinity, 49.h),
          ),
          child: Text(
            'Edit',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
