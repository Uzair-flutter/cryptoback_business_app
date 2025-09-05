import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:cryptoback_business_app/utils/custom_font_style.dart';
import 'package:cryptoback_business_app/widgets/custom_app_bar_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: "Help Center", showActionButton: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0.w),

        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.h),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
                  prefixIcon: Icon(Iconsax.search_normal),
                ),
              ),
              SizedBox(height: 35.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14000000), // #000000 with 8% opacity
                      offset: Offset(0, 0),
                      blurRadius: 30,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: ExpansionTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: black18w500center(data: "Bitcoin Back"),
                    ),
                    iconColor: AppColors.kPrimaryColor,
                    collapsedIconColor: AppColors.kPrimaryColor,
                    maintainState: true,
                    shape: Border.all(color: Colors.transparent),
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: EdgeInsets.zero,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Purus sit pellentesque ac arcu aenean vel tortor. Dui scelerisque in massa velit urna erat. Massa aliquam metus neque nec purus ipsum nec neque a. Rhoncus sagittis nascetur a convallis in scelerisque vitae ullamcorper. Ipsum auctor in.",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14000000), // #000000 with 8% opacity
                      offset: Offset(0, 0),
                      blurRadius: 30,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: ExpansionTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: black18w500center(data: "Bitcoin Back"),
                    ),
                    iconColor: AppColors.kPrimaryColor,
                    collapsedIconColor: AppColors.kPrimaryColor,
                    maintainState: true,
                    shape: Border.all(color: Colors.transparent),
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: EdgeInsets.zero,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Purus sit pellentesque ac arcu aenean vel tortor. Dui scelerisque in massa velit urna erat. Massa aliquam metus neque nec purus ipsum nec neque a. Rhoncus sagittis nascetur a convallis in scelerisque vitae ullamcorper. Ipsum auctor in.",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14000000), // #000000 with 8% opacity
                      offset: Offset(0, 0),
                      blurRadius: 30,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: ExpansionTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: black18w500center(data: "Bitcoin Back"),
                    ),
                    iconColor: AppColors.kPrimaryColor,
                    collapsedIconColor: AppColors.kPrimaryColor,
                    maintainState: true,
                    shape: Border.all(color: Colors.transparent),
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: EdgeInsets.zero,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Purus sit pellentesque ac arcu aenean vel tortor. Dui scelerisque in massa velit urna erat. Massa aliquam metus neque nec purus ipsum nec neque a. Rhoncus sagittis nascetur a convallis in scelerisque vitae ullamcorper. Ipsum auctor in.",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14000000), // #000000 with 8% opacity
                      offset: Offset(0, 0),
                      blurRadius: 30,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: ExpansionTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: black18w500center(data: "Bitcoin Back"),
                    ),
                    iconColor: AppColors.kPrimaryColor,
                    collapsedIconColor: AppColors.kPrimaryColor,
                    maintainState: true,
                    shape: Border.all(color: Colors.transparent),
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: EdgeInsets.zero,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Purus sit pellentesque ac arcu aenean vel tortor. Dui scelerisque in massa velit urna erat. Massa aliquam metus neque nec purus ipsum nec neque a. Rhoncus sagittis nascetur a convallis in scelerisque vitae ullamcorper. Ipsum auctor in.",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14000000), // #000000 with 8% opacity
                      offset: Offset(0, 0),
                      blurRadius: 30,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: ExpansionTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: black18w500center(data: "Bitcoin Back"),
                    ),
                    iconColor: AppColors.kPrimaryColor,
                    collapsedIconColor: AppColors.kPrimaryColor,
                    maintainState: true,
                    shape: Border.all(color: Colors.transparent),
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: EdgeInsets.zero,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Purus sit pellentesque ac arcu aenean vel tortor. Dui scelerisque in massa velit urna erat. Massa aliquam metus neque nec purus ipsum nec neque a. Rhoncus sagittis nascetur a convallis in scelerisque vitae ullamcorper. Ipsum auctor in.",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14000000), // #000000 with 8% opacity
                      offset: Offset(0, 0),
                      blurRadius: 30,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: ExpansionTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: black18w500center(data: "Bitcoin Back"),
                    ),
                    iconColor: AppColors.kPrimaryColor,
                    collapsedIconColor: AppColors.kPrimaryColor,
                    maintainState: true,
                    shape: Border.all(color: Colors.transparent),
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: EdgeInsets.zero,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Purus sit pellentesque ac arcu aenean vel tortor. Dui scelerisque in massa velit urna erat. Massa aliquam metus neque nec purus ipsum nec neque a. Rhoncus sagittis nascetur a convallis in scelerisque vitae ullamcorper. Ipsum auctor in.",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14000000), // #000000 with 8% opacity
                      offset: Offset(0, 0),
                      blurRadius: 30,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: ExpansionTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: black18w500center(data: "Bitcoin Back"),
                    ),
                    iconColor: AppColors.kPrimaryColor,
                    collapsedIconColor: AppColors.kPrimaryColor,
                    maintainState: true,
                    shape: Border.all(color: Colors.transparent),
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: EdgeInsets.zero,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur. Purus sit pellentesque ac arcu aenean vel tortor. Dui scelerisque in massa velit urna erat. Massa aliquam metus neque nec purus ipsum nec neque a. Rhoncus sagittis nascetur a convallis in scelerisque vitae ullamcorper. Ipsum auctor in.",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
