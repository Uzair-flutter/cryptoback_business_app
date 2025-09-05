import 'package:cryptoback_business_app/resources/assets.dart';
import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:cryptoback_business_app/widgets/custom_app_bar_2.dart';
// class BusinessReferralProgramView extends StatefulWidget {
//   const BusinessReferralProgramView({super.key});
//
//   @override
//   State<BusinessReferralProgramView> createState() =>
//       _BusinessReferralProgramViewState();
// }
//
// class _BusinessReferralProgramViewState
//     extends State<BusinessReferralProgramView> {
//   bool isMyLinksSelected = true;
//   bool isGenerateLink = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar2(title: "Referral Program", showActionButton: false),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 25.w),
//         child: Column(
//           children: [
//             // Row(
//             //   children: [
//             //     Expanded(
//             //       child: ElevatedButton(
//             //         style: ElevatedButton.styleFrom(
//             //           backgroundColor: isMyLinksSelected
//             //               ? AppColors.kPrimaryColor
//             //               : Color(0xFFEFEFEF),
//             //           elevation: 0,
//             //         ),
//             //         onPressed: () {
//             //           setState(() {
//             //             isMyLinksSelected = true;
//             //           });
//             //         },
//             //         child: Text(
//             //           "My Links",
//             //           style: TextStyle(
//             //             color: isMyLinksSelected
//             //                 ? AppColors.whiteColor
//             //                 : Color(0xffC0C0C0),
//             //           ),
//             //         ),
//             //       ),
//             //     ),
//             //     SizedBox(width: 10.w),
//             //     Expanded(
//             //       child: ElevatedButton(
//             //         style: ElevatedButton.styleFrom(
//             //           backgroundColor: !isMyLinksSelected
//             //               ? AppColors.kPrimaryColor
//             //               : Color(0xFFEFEFEF),
//             //           elevation: 0,
//             //         ),
//             //         onPressed: () {
//             //           setState(() {
//             //             isMyLinksSelected = false;
//             //           });
//             //         },
//             //         child: Text(
//             //           "Referrals",
//             //           style: TextStyle(
//             //             color: !isMyLinksSelected
//             //                 ? AppColors.whiteColor
//             //                 : Color(0xffC0C0C0),
//             //           ),
//             //         ),
//             //       ),
//             //     ),
//             //   ],
//             // ),
//             SizedBox(height: 30.h),
//             Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       setState(() {
//                         isMyLinksSelected = true;
//                       });
//                     },
//                     child: Container(
//                       width: 166.5.w, // Set width to 166.5.w
//                       height: 34.h, // Set height to 34.h
//                       decoration: BoxDecoration(
//                         color: isMyLinksSelected
//                             ? AppColors.kPrimaryColor
//                             : Color(0xFFEFEFEF),
//                         borderRadius: BorderRadius.circular(
//                           7,
//                         ), // Apply border radius of 7
//                       ),
//                       alignment: Alignment.center,
//                       child: Text(
//                         "My Links",
//                         style: TextStyle(
//                           color: isMyLinksSelected
//                               ? AppColors.whiteColor
//                               : Color(0xffC0C0C0),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10.w),
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       setState(() {
//                         isMyLinksSelected = false;
//                       });
//                     },
//                     child: Container(
//                       width: 166.5.w, // Set width to 166.5.w
//                       height: 34.h, // Set height to 34.h
//                       decoration: BoxDecoration(
//                         color: !isMyLinksSelected
//                             ? AppColors.kPrimaryColor
//                             : Color(0xFFEFEFEF),
//                         borderRadius: BorderRadius.circular(
//                           7,
//                         ), // Apply border radius of 7
//                       ),
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Referrals",
//                         style: TextStyle(
//                           color: !isMyLinksSelected
//                               ? AppColors.whiteColor
//                               : Color(0xffC0C0C0),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//             if (isMyLinksSelected == true)
//               SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     SizedBox(height: 128.h),
//                     SvgPicture.asset(SvgAssets.referral),
//                     SizedBox(height: 24.h),
//                     if (!isGenerateLink == true)
//                       Row(
//                         children: [
//                           Expanded(
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 setState(() {
//                                   isGenerateLink = true;
//                                 });
//                               },
//                               child: Text("Generate Referral Link "),
//                             ),
//                           ),
//                         ],
//                       ),
//                     if (!isGenerateLink == true) SizedBox(height: 25.h),
//                     if (isGenerateLink == true)
//                       TextFormField(
//                         readOnly: true,
//                         decoration: InputDecoration(
//                           hint: Text("Link will appear here"),
//                           suffixIcon: Icon(
//                             Iconsax.copy,
//                             color: AppColors.blackColor,
//                           ),
//                         ),
//                       ),
//                     SizedBox(height: 24.h),
//                     if (isGenerateLink == true)
//                       Row(
//                         children: [
//                           Expanded(
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 setState(() {
//                                   isGenerateLink = true;
//                                 });
//                               },
//                               child: Text("Share Link "),
//                             ),
//                           ),
//                         ],
//                       ),
//                     SizedBox(height: 12.h),
//                     if (isGenerateLink == true)
//                       Text('Share this link to enjoy more incentives.'),
//                   ],
//                 ),
//               ),
//             if (isMyLinksSelected == false)
//               Expanded(
//                 child: Column(
//                   children: [
//                     SizedBox(height: 25.h),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: referrals.length,
//                         itemBuilder: (context, index) {
//                           final referral = referrals[index];
//                           return ReferralListTile(
//                             name: referral['name']!,
//                             referralDate: referral['date']!,
//                             initials: referral['initials']!,
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//             SizedBox(height: 25.h),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Example usage in ListView.builder

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

import '../../widgets/business_referral_tile.dart';
import '../notifier/business_profile_notifier.dart';

class BusinessReferralProgramView extends ConsumerWidget {
  const BusinessReferralProgramView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final referralState = ref.watch(businessProfileProvider);
    final referralNotifier = ref.read(businessProfileProvider.notifier);

    return Scaffold(
      appBar: CustomAppBar2(title: "Referral Program", showActionButton: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => referralNotifier.selectMyLinks(),
                    child: Container(
                      width: 166.5.w,
                      height: 34.h,
                      decoration: BoxDecoration(
                        color: referralState.isMyLinksSelected
                            ? AppColors.kPrimaryColor
                            : Color(0xFFEFEFEF),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "My Links",
                        style: TextStyle(
                          color: referralState.isMyLinksSelected
                              ? AppColors.whiteColor
                              : Color(0xffC0C0C0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: InkWell(
                    onTap: () => referralNotifier.selectReferrals(),
                    child: Container(
                      width: 166.5.w,
                      height: 34.h,
                      decoration: BoxDecoration(
                        color: !referralState.isMyLinksSelected
                            ? AppColors.kPrimaryColor
                            : Color(0xFFEFEFEF),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Referrals",
                        style: TextStyle(
                          color: !referralState.isMyLinksSelected
                              ? AppColors.whiteColor
                              : Color(0xffC0C0C0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            if (referralState.isMyLinksSelected)
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 128.h),
                    SvgPicture.asset(SvgAssets.referral),
                    SizedBox(height: 24.h),
                    if (!referralState.isGenerateLink)
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () =>
                                  referralNotifier.setGenerateLink(true),
                              child: Text("Generate Referral Link"),
                            ),
                          ),
                        ],
                      ),
                    if (!referralState.isGenerateLink) SizedBox(height: 25.h),
                    if (referralState.isGenerateLink)
                      TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hint: Text("Link will appear here"),
                          suffixIcon: Icon(
                            Iconsax.copy,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                    SizedBox(height: 24.h),
                    if (referralState.isGenerateLink)
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle share link logic here
                              },
                              child: Text("Share Link"),
                            ),
                          ),
                        ],
                      ),
                    SizedBox(height: 12.h),
                    if (referralState.isGenerateLink)
                      Text('Share this link to enjoy more incentives.'),
                  ],
                ),
              ),

            if (!referralState.isMyLinksSelected)
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 25.h),
                    Expanded(
                      child: ListView.builder(
                        itemCount: referrals.length,
                        itemBuilder: (context, index) {
                          final referral = referrals[index];
                          return ReferralListTile(
                            name: referral['name']!,
                            referralDate: referral['date']!,
                            initials: referral['initials']!,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> referrals = [
  {'name': 'John Doe', 'date': 'March 17!', 'initials': 'JD'},
  {'name': 'Jane Smith', 'date': 'March 15!', 'initials': 'JS'},
  {'name': 'Mike Johnson', 'date': 'March 12!', 'initials': 'MJ'},
  {'name': 'John Doe', 'date': 'March 17!', 'initials': 'JD'},
  {'name': 'Jane Smith', 'date': 'March 15!', 'initials': 'JS'},
  {'name': 'Mike Johnson', 'date': 'March 12!', 'initials': 'MJ'},
  {'name': 'John Doe', 'date': 'March 17!', 'initials': 'JD'},
  {'name': 'Jane Smith', 'date': 'March 15!', 'initials': 'JS'},
  {'name': 'Mike Johnson', 'date': 'March 12!', 'initials': 'MJ'},
  {'name': 'John Doe', 'date': 'March 17!', 'initials': 'JD'},
  {'name': 'Jane Smith', 'date': 'March 15!', 'initials': 'JS'},
  {'name': 'Mike Johnson', 'date': 'March 12!', 'initials': 'MJ'},
  {'name': 'John Doe', 'date': 'March 17!', 'initials': 'JD'},
];
