import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets.dart';
import '../../widgets/bottom sheets/campagin_detail.dart';
import '../../widgets/custom_blue_app_bar.dart';
import 'all_campaigns_view.dart';

class BusinessDashboardView extends ConsumerWidget {
  const BusinessDashboardView({super.key});

  @override
  Widget build(BuildContext context, watchRef) {
    return Scaffold(
      appBar: CustomBlueAppBar(
        title: '    Hi, Welcome John Doe',
        showActions: true,
        showLeading: false,
        // actions: [
        //   Container(
        //     height: 30.h,
        //     width: 30.w,
        //     decoration: BoxDecoration(
        //       color: AppColors.whiteColor,
        //       shape: BoxShape.circle,
        //     ),
        //     child: Icon(
        //       Iconsax.notification,
        //       color: AppColors.kPrimaryColor,
        //       size: 17.5.sp,
        //     ),
        //   ),
        //   SizedBox(width: 10.w),
        //   Container(
        //     height: 30.h,
        //     width: 30.w,
        //     decoration: BoxDecoration(
        //       color: AppColors.whiteColor,
        //       shape: BoxShape.circle,
        //     ),
        //     child: Icon(
        //       Icons.person,
        //       color: AppColors.kPrimaryColor,
        //       size: 17.5.sp,
        //     ),
        //   ),
        //   SizedBox(width: 15.w),
        // ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10.h),
            Center(
              child: Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                // physics: NeverScrollableScrollPhysics(),
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 2, // Number of columns
                //   crossAxisSpacing: 10.w, // Horizontal spacing between items
                //   mainAxisSpacing: 10.h, // Vertical spacing between items
                //   childAspectRatio: 166.5.w / 106.h,
                // Aspect ratio of the child items
                //)
                children: [
                  Container(
                    width: 170.5.w,
                    // height: 106.w,
                    decoration: BoxDecoration(
                      color: Color(0xffFEF4E8), // Container background color
                      borderRadius: BorderRadius.circular(8.r),
                      border: BoxBorder.all(
                        color: Color(0xffF18E19),
                        width: 1.w,
                      ), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 6,
                          offset: Offset(0, 3), // Shadow position
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            SvgAssets.roundMoneyOrange,
                            width: 20.w,
                            height: 20.h,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Cashback Issued',
                            style: TextStyle(
                              color: Colors.black, // Text color
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              // Font size (scaled with screen size)
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '\$2000', // Displaying the item number
                            style: TextStyle(
                              color: Color(0xffF18E19), // Text color
                              fontSize: 17.sp,
                              fontWeight: FontWeight
                                  .w800, // Font size (scaled with screen size)
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '+10% vs last month',
                            style: TextStyle(
                              // Text color
                              fontSize: 10.sp,
                              // Font size (scaled with screen size)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 170.5.w,
                    // height: 106.h,
                    decoration: BoxDecoration(
                      color: Color(0xffEDF2FF), // Container background color
                      borderRadius: BorderRadius.circular(8.r),
                      border: BoxBorder.all(
                        color: Color(0xff336AFF),
                        width: 1.w,
                      ), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 6,
                          offset: Offset(0, 3), // Shadow position
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            SvgAssets.roundMoneyBlue,
                            width: 20.w,
                            height: 20.h,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Most Active Campaign',
                            style: TextStyle(
                              color: Colors.black, // Text color
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              // Font size (scaled with screen size)
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Summer Sale', // Displaying the item number
                            style: TextStyle(
                              color: Color(0xff336AFF), // Text color
                              fontSize: 17.sp,
                              fontWeight: FontWeight
                                  .w800, // Font size (scaled with screen size)
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '+10% vs last month',
                            style: TextStyle(
                              // Text color
                              fontSize: 10.sp,
                              // Font size (scaled with screen size)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 170.5.w,
                    //    height: 106.h,
                    decoration: BoxDecoration(
                      color: Color(0xffEDF2FF), // Container background color
                      borderRadius: BorderRadius.circular(8.r),
                      border: BoxBorder.all(
                        color: Color(0xff336AFF),
                        width: 1.w,
                      ), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 6,
                          offset: Offset(0, 3), // Shadow position
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            SvgAssets.roundMoneyBlue,
                            width: 20.w,
                            height: 20.h,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Referrals Used',
                            style: TextStyle(
                              color: Colors.black, // Text color
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              // Font size (scaled with screen size)
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '140', // Displaying the item number
                            style: TextStyle(
                              color: Color(0xff336AFF), // Text color
                              fontSize: 17.sp,
                              fontWeight: FontWeight
                                  .w800, // Font size (scaled with screen size)
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '+10% vs last month',
                            style: TextStyle(
                              // Text color
                              fontSize: 10.sp,
                              // Font size (scaled with screen size)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 170.5.w,
                    //   height: 106.h,
                    decoration: BoxDecoration(
                      color: Color(0xffFEF4E8), // Container background color
                      borderRadius: BorderRadius.circular(8.r),
                      border: BoxBorder.all(
                        color: Color(0xffF18E19),
                        width: 1.w,
                      ), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 6,
                          offset: Offset(0, 3), // Shadow position
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            SvgAssets.roundMoneyOrange,
                            width: 20.w,
                            height: 20.h,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Active Users',
                            style: TextStyle(
                              color: Colors.black, // Text color
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              // Font size (scaled with screen size)
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '560', // Displaying the item number
                            style: TextStyle(
                              color: Color(0xffF18E19), // Text color
                              fontSize: 17.sp,
                              fontWeight: FontWeight
                                  .w800, // Font size (scaled with screen size)
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '+10% vs last month',
                            style: TextStyle(
                              // Text color
                              fontSize: 10.sp,
                              // Font size (scaled with screen size)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Text(
                  'Recent Campaigns',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: AppColors.blackColor,
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllCampaignsScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'View all',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                      color: AppColors.kPrimaryColor,
                      decorationColor: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: Consumer(
                builder: (context, ref, child) {
                  final campaigns = getCampaignsData();
                  return ListView.builder(
                    itemCount: campaigns.length,
                    itemBuilder: (context, index) {
                      final campaign = campaigns[index];
                      return GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            //  backgroundColor: Colors.,
                            builder: (context) => CampaignDetailBottomSheet(),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 12.h),
                          padding: EdgeInsets.all(14.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.04),
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Avatar with initials
                              Container(
                                width: 30.w,
                                height: 30.h,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE9E9E9),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.kPrimaryColor,
                                    width: 1.w,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'JD',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 12.w),

                              // Campaign details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Campaign type tag
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8.w,
                                            vertical: 3.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFEF4E8),
                                            borderRadius: BorderRadius.circular(
                                              43.r,
                                            ),
                                          ),
                                          child: Text(
                                            campaign.type,
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFFF18E19),
                                            ),
                                          ),
                                        ),

                                        Icon(
                                          Icons.more_horiz,
                                          color: AppColors.blackColor2,
                                          size: 20.sp,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.h),

                                    // Campaign title
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          campaign.title,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF212121),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10.w,
                                            vertical: 4.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: campaign.isActive
                                                ? Color(0xFFE8F5E8)
                                                : Color(0xFFFCE4EC),
                                            borderRadius: BorderRadius.circular(
                                              12.r,
                                            ),
                                          ),
                                          child: Text(
                                            campaign.isActive
                                                ? 'Active'
                                                : 'Expired',
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: campaign.isActive
                                                  ? Color(0xFF129E00)
                                                  : AppColors.redColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4.h),

                                    // Date and ID row
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          campaign.date,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF757575),
                                          ),
                                        ),
                                        Text(
                                          'ID: ${campaign.id}',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.blackColor2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
