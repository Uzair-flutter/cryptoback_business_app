import 'package:cryptoback_business_app/app_routes.dart';
import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_app_bar_2.dart';

class PurchaseDetailScreen extends StatelessWidget {
  static const String routeName = '/purchaseDetailScreen';
  const PurchaseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: 'Purchase Details', showActionButton: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),

            // Customer Details Section
            _buildSectionTitle('Details'),
            SizedBox(height: 10.h),
            _buildCustomerDetails(),

            SizedBox(height: 12.h),
            _buildDivider(),
            SizedBox(height: 12.h),

            // Order Details Section
            _buildSectionTitle('Order Details'),

            SizedBox(height: 10.h),
            _buildOrderDetails(),

            SizedBox(height: 15.h),
            _buildDivider(),
            SizedBox(height: 15.h),

            // Total
            _buildTotal(),

            Spacer(),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, receiptSentRoute);
                },
                child: Text('Submit'),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.lightBlackColor,
      ),
    );
  }

  Widget _buildCustomerDetails() {
    return Column(
      children: [
        _buildDetailRow('Customer Name:', 'John Doe'),
        SizedBox(height: 8.h),
        _buildDetailRow('Address:', '10143 W Broad Street, Lane 04, NewYork.'),
        SizedBox(height: 8.h),
        _buildDetailRow('Purchase Date:', '12 Jun, 2025'),
        SizedBox(height: 8.h),
        _buildDetailRow('Store Number:', '1458745'),
        SizedBox(height: 8.h),
        _buildDetailRow('Store Manager:', 'John Smith'),
      ],
    );
  }

  Widget _buildOrderDetails() {
    return Column(
      children: [
        _buildDetailRow('1 Cheese Oyster', '\$5.00'),
        SizedBox(height: 8.h),
        _buildDetailRow('1 Mustard Oyster:', '\$5.00'),
        SizedBox(height: 8.h),
        _buildDetailRow('1 Carbonian Pasta:', '\$5.00'),
        SizedBox(height: 8.h),
        _buildDetailRow('1 Salt Egg Noodles', '\$5.00'),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Text(
            label,
            style: GoogleFonts.montserrat(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.lightBlackColor,
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          flex: 6,
          child: Text(
            maxLines: 2,
            value,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.lightBlackColor,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Widget _buildTotal() {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        'Total: \$20.00',
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.lightBlackColor,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(height: 1.h, color: AppColors.strokeColor);
  }
}
