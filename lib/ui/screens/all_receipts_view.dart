import 'package:cryptoback_business_app/widgets/custom_blue_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

import '../../resources/assets.dart';
import '../../widgets/bottom sheets/receipt_details.dart';
import '../../widgets/receipts_tile.dart';
import 'all_campaigns_view.dart';

class AllReceiptsView extends ConsumerWidget {
  const AllReceiptsView({super.key});

  @override
  Widget build(BuildContext context, watchRef) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomBlueAppBar(
        title: 'All Receipts',
        showActions: false,
        showLeading: false,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50.h,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              prefixIcon: Icon(
                                Iconsax.search_normal,
                                size: 20.sp,
                              ),
                              // filled: true,
                              // fillColor: AppColors.lightGreyColor,
                              // contentPadding: EdgeInsets.symmetric(
                              //   vertical: 5.h,
                              //   horizontal: 5.w,
                              // ),
                              // enabledBorder: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(14.r),
                              //   borderSide: BorderSide(
                              //     color: AppColors.borderGreyColor,
                              //     width: 1.w,
                              //   ),
                              // ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF3C70FF), Color(0xFF8FADFF)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15.w),
                          child: SvgPicture.asset(
                            SvgAssets.filter,
                            // height: 20.w,
                            // width: 20.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Expanded(
                    //   height: 600.h,
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
                                      //  backgroundColor: Colors.,
                                      builder: (context) =>
                                          ReceiptDetailsBottomSheet(),
                                    );
                                  },
                                  child: ReceiptsTile(),
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
              // Positioned(
              //   bottom: keyboardHeight > 0
              //       ? screenHeight *
              //             0.1 // When keyboard is open, position higher
              //       : 300.h, // Normal position when keyboard is closed
              //   right: 15.w,
              //   child: AnimatedContainer(
              //     duration: Duration(milliseconds: 200), // Smooth transition
              //     child: InkWell(
              //       onTap: () {},
              //       child: Container(
              //         width: 50.0.w,
              //         height: 48.0.h,
              //         decoration: BoxDecoration(
              //           gradient: LinearGradient(
              //             colors: [Color(0xFF3C70FF), Color(0xFF8FADFF)],
              //             begin: Alignment.topCenter,
              //             end: Alignment.bottomCenter,
              //           ),
              //           borderRadius: BorderRadius.circular(10.r),
              //         ),
              //         child: Icon(Icons.add, color: Colors.white, size: 25.w),
              //       ),
              //     ),
              //   ),
              // ),
              // Positioned(
              //   bottom: 300.h,
              //   right: 15.w,
              //   child: InkWell(
              //     onTap: () {
              //       debugPrint('Floating Action Button Pressed');
              //     },
              //     child: Container(
              //       width: 50.0
              //           .w, // Set width and height to match the default FloatingActionButton size
              //       height: 48.h,
              //       decoration: BoxDecoration(
              //         gradient: LinearGradient(
              //           colors: [Color(0xFF3C70FF), Color(0xFF8FADFF)],
              //           begin: Alignment.topCenter,
              //           end: Alignment.bottomCenter,
              //         ),
              //
              //         borderRadius: BorderRadius.circular(
              //           10.r,
              //         ), // Make the container circular to match FloatingActionButton
              //       ),
              //       child: Icon(Icons.add, color: Colors.white, size: 25.w),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
