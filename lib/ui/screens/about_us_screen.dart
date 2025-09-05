import 'package:cryptoback_business_app/utils/custom_font_style.dart';
import 'package:cryptoback_business_app/widgets/custom_app_bar_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsScreen extends StatelessWidget {
  static const String routeName = '/about_us';
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: "About Us", showActionButton: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),

            black14w400center(data: "Our Mission"),
            SizedBox(height: 5.h),
            Flexible(
              child: black13w400center(
                data:
                    ". Lorem ipsum dolor sit amet consectetur. Porttitor in ornare convallis mauris proin in sapien non. Massa arcu mi faucibus id nunc urna in. Vestibulum augue enim tristique aliquet nec tellus gravida vitae. Vitae fusce eget adipiscing ullamcorper condimentum a mollis hendrerit. Ultrices pellentesque tristique pretium metus ultricies in semper amet. Quis vitae fermentum magna enim sed tempus. Tempor platea at nec vitae donec gravida aenean arcu. Senectus nulla a facilisis nunc cras lorem eget. Neque sollicitudin.",
              ),
            ),
            SizedBox(height: 10.h),
            black14w400center(data: "Our Story"),
            SizedBox(height: 10.h),
            Flexible(
              child: black13w400center(
                data:
                    ". Lorem ipsum dolor sit amet consectetur. Porttitor in ornare convallis mauris proin in sapien non. Massa arcu mi faucibus id nunc urna in. Vestibulum augue enim tristique aliquet nec tellus gravida vitae. Vitae fusce eget adipiscing ullamcorper condimentum a mollis hendrerit. Ultrices pellentesque tristique pretium metus ultricies in semper amet. Quis vitae fermentum magna enim sed tempus. Tempor platea at nec vitae donec gravida aenean arcu. Senectus nulla a facilisis nunc cras lorem eget. Neque sollicitudin.",
              ),
            ),
            SizedBox(height: 10.h),
            black14w400center(data: "What We Offer"),
            SizedBox(height: 10.h),
            Flexible(
              child: black13w400center(
                data:
                    ". Lorem ipsum dolor sit amet consectetur. Porttitor in ornare convallis mauris proin in sapien non. Massa arcu mi faucibus id nunc urna in. Vestibulum augue enim tristique aliquet nec tellus gravida vitae. Vitae fusce eget adipiscing ullamcorper condimentum a mollis hendrerit. Ultrices pellentesque tristique pretium metus ultricies in semper amet. Quis vitae fermentum magna enim sed tempus. Tempor platea at nec vitae donec gravida aenean arcu. Senectus nulla a facilisis nunc cras lorem eget. Neque sollicitudin.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
