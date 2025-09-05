import 'package:cryptoback_business_app/utils/custom_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestWithdrawalBottom extends StatelessWidget {
  const RequestWithdrawalBottom({super.key});

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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10.h),
            Container(
              margin: EdgeInsets.only(top: 12.h, bottom: 20.h),
              width: 60.w,
              height: 6.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(height: 10.h),
            black22w600center(data: "Request Withdrawal"),
            SizedBox(height: 30.h),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Enter Withdrawal Amount"),
            ),
            SizedBox(height: 30.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Submit"),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
    // Handle

    // Title
  }
}
