import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:cryptoback_business_app/utils/custom_font_style.dart';
import 'package:cryptoback_business_app/widgets/bottom%20sheets/create_new_campaign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'edit_campaign.dart';

class CampaignDetailBottomSheet extends StatelessWidget {
  final String campaignName;
  final String campaignId;
  final String discountType;
  final int totalRedemptions;
  final String status;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const CampaignDetailBottomSheet({
    super.key,
    this.campaignName = "Black Friday Sale",
    this.campaignId = "14545782",
    this.discountType = "Percentage",
    this.totalRedemptions = 521,
    this.status = "Active",
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return
    //  height: 487.h,
    SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 12.h),
                width: 60.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            SizedBox(height: 36.h),
            Center(child: black22w600center(data: "Campaign Detail")),
            SizedBox(height: 20.h),
            // Content - wrapped in SingleChildScrollView for responsiveness
            Container(
              width: double.infinity,
              height: 148.h,

              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),

            SizedBox(height: 16.h),

            // Campaign name
            black16w600center(data: campaignName),

            SizedBox(height: 16.h),

            // Campaign details
            _buildDetailRow("ID", campaignId),
            SizedBox(height: 10.h),
            _buildDetailRow("Discount Type", discountType),
            SizedBox(height: 10.h),
            _buildDetailRow("Total Redemptions", totalRedemptions.toString()),
            SizedBox(height: 10.h),
            _buildDetailRow("Status", status, isStatus: true),

            SizedBox(height: 24.h),

            // Action buttons - responsive layout
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        clipBehavior: Clip.antiAlias,
                        useSafeArea: true,
                        builder: (context) => Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: CreateNewCampaign(isEdit: true),
                        ),
                      );
                    },
                    child: Text("Edit"),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Delete"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.redColor,
                    ),
                  ),
                ),
              ],
            ),

            // Bottom safe area
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isStatus = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        black14w500center(data: label),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            color: isStatus ? const Color(0xFF10B981) : AppColors.blackColor2,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
