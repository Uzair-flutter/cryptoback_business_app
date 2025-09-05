import 'package:cryptoback_business_app/app_routes.dart';
import 'package:cryptoback_business_app/resources/assets.dart';
import 'package:cryptoback_business_app/ui/screens/customer_profile_screen.dart';
import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:cryptoback_business_app/ui/widgets/profile_card.dart';
import 'package:cryptoback_business_app/utils/custom_font_style.dart';
import 'package:cryptoback_business_app/widgets/bottom%20sheets/request_withdrawal.dart';
import 'package:cryptoback_business_app/widgets/custom_app_bar_2.dart';
import 'package:cryptoback_business_app/widgets/transcation_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class EWallet extends StatelessWidget {
  const EWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: "e-Wallet", showActionButton: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            Container(
              //  height: 148.h,
              width: 343.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF3C70FF), Color(0xFF8FADFF)],
                ),
              ),
              child: Stack(
                children: [
                  // Geometric pattern overlay
                  Positioned.fill(
                    child: CustomPaint(painter: HexagonPatternPainter()),
                  ),
                  // Content
                  Padding(
                    padding: EdgeInsets.only(
                      top: 16.h,
                      bottom: 16.h,
                      left: 15.w,
                      right: 10.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Available Balance",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "523.99 USD",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "550 BTC",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "550 BTC = 111,498.70 USD",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          //  height: 33.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) => Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: RequestWithdrawalBottom(),
                                ),
                              );
                            },
                            child: Text(
                              "Request Withdrawal",
                              style: TextStyle(
                                color: AppColors.kPrimaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProfileCard(
                  percentage: "147.98",
                  label: "Total Cashback Earned",
                  height: 67.h,
                  width: 166.w,
                ),
                ProfileCard(
                  percentage: "20.00",
                  label: "Pending Cashback",
                  height: 67.h,
                  width: 166.w,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProfileCard(
                  percentage: "523.99",
                  label: "Cashback In BTC",
                  height: 67.h,
                  width: 166.w,
                ),
                ProfileCard(
                  percentage: "523.99",
                  label: "Cashback In UDS",
                  height: 67.h,
                  width: 166.w,
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                black18w500center(data: "Recent Transactions"),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, eWalletListRoute);
                  },
                  child: Text(
                    "view All",
                    style: TextStyle(
                      color: AppColors.kPrimaryColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: GestureDetector(
                      onTap: () {},
                      child: TransactionTile(
                        imagePath: DummyAssets.mcdonald2,
                        date: "10/15/2025",
                        amount: "\$2.55",
                        description:
                            "cash back for spending \$127.53 at Cost Plus World Market.",
                        showDivider: true,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
