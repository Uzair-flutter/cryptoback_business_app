import 'package:cryptoback_business_app/resources/assets.dart';
import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:cryptoback_business_app/utils/custom_font_style.dart';
import 'package:cryptoback_business_app/widgets/custom_app_bar_2.dart';
import 'package:cryptoback_business_app/widgets/transcation_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EWalletList extends StatelessWidget {
  const EWalletList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: "e-Wallet", showActionButton: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Text(
              "All Transactions",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: 15.h),
            Expanded(
              child: ListView.builder(
                itemCount: 9,
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
