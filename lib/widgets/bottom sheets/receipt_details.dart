import 'package:cryptoback_business_app/ui/themes/color_constants.dart';
import 'package:cryptoback_business_app/utils/custom_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReceiptDetailsBottomSheet extends StatelessWidget {
  const ReceiptDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            margin: EdgeInsets.only(top: 12.h, bottom: 20.h),
            width: 60.w,
            height: 6.h,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          black22w600center(data: 'Receipt Details'),

          // Title
          SizedBox(height: 24),

          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                // Combined Details Container
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Customer Details Section
                      _buildSection(
                        title: 'Customer Details',
                        children: [
                          _buildDetailRow('Customer Name:', 'John Doe'),
                          _buildDetailRow(
                            'Address:',
                            '10143 W Broad Street, Lane 04, NewYork.',
                          ),
                          _buildDetailRow('Purchase Date:', '12 Jun, 2025'),
                          _buildDetailRow('Store Number:', '1458745'),
                          _buildDetailRow('Store Manager:', 'John Smith'),
                        ],
                      ),

                      // Divider
                      const Divider(
                        height: 32,
                        thickness: 1,
                        color: Colors.grey,
                      ),

                      // Order Details Section
                      _buildSection(
                        title: 'Order Details',
                        children: [
                          _buildOrderItem('1 Cheese Oyster', '\$5.00'),
                          _buildOrderItem('1 Mustard Oyster:', '\$5.00'),
                          _buildOrderItem('1 Carbonian Pasta:', '\$5.00'),
                          _buildOrderItem('1 Salt Egg Noodles', '\$5.00'),
                          const SizedBox(height: 16),
                          _buildTotalRow(),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        child: const Text('Approve'),
                      ),
                    ),
                    SizedBox(width: 16.h),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.redColor,
                          side: const BorderSide(color: AppColors.redColor),
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          'Reject',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        black16w500center(data: title),

        SizedBox(height: 16),
        ...children,
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: listTileTextBlackColor12w400center(data: label),
          ),
          Expanded(
            flex: 3,
            child: listTileTextBlackColor14w400center(data: value),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem(String item, String price) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(child: listTileTextBlackColor12w400center(data: item)),
          listTileTextBlackColor14w400center(data: price),
        ],
      ),
    );
  }

  Widget _buildTotalRow() {
    return Align(
      alignment: Alignment.topRight,
      child: listTileTextBlackColor12w600center(data: 'Total:\$20.00'),
    );
    // return Row(
    //   children: [
    //     const Text(
    //       'Total:',
    //       style: TextStyle(
    //         fontSize: 16,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.black87,
    //       ),
    //     ),
    //     const Spacer(),
    //     const Text(
    //       '\$20.00',
    //       style: TextStyle(
    //         fontSize: 16,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.black87,
    //       ),
    //     ),
    //   ],
    // );
  }
}
