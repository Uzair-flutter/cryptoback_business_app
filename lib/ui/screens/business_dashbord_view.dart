import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets.dart';
import '../../widgets/bottom sheets/campagin_detail.dart';
import '../../widgets/campaign_tile.dart';
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
                      final isLastItem = index == campaigns.length - 1;
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) =>
                                    CampaignDetailBottomSheet(),
                              );
                            },
                            child: CampaignTile(
                              title: campaign.title,
                              type: campaign.type,
                              date: campaign.date,
                              amount: campaign.date,
                              id: campaign.id,
                              isActive: campaign.isActive,
                            ),
                          ),
                          if (isLastItem) SizedBox(height: 100.h),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            // SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
