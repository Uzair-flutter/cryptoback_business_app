// ui/widgets/describe_business_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../notifier/business_step_notifier.dart';
import '../themes/color_constants.dart';

class DescribeBusiness extends ConsumerStatefulWidget {
  const DescribeBusiness({super.key});

  @override
  ConsumerState<DescribeBusiness> createState() => _DescribeBusinessState();
}

class _DescribeBusinessState extends ConsumerState<DescribeBusiness> {
  @override
  Widget build(BuildContext context) {
    final businessNotifier = ref.read(businessStepProvider.notifier);

    return Column(
      children: [
        SizedBox(height: 16.h),
        // Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            'Describe Your Business',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1F2937),
              height: 1.3,
            ),
          ),
        ),
        SizedBox(height: 32.h),
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TextFormField(
              controller: businessNotifier.businessDescriptionController,
              maxLines: 7,
              maxLength: 100,
              onChanged: (value) {
                businessNotifier.updateBusinessDescription(value);
              },
              decoration: InputDecoration(
                fillColor: Color(0xffF5F9FE),
                hintText: 'Write here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: const Color(0xFFB5B5B5),
                    width: 1.w,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                    color: const Color(0xFFB5B5B5),
                    width: 1.w,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                    color: AppColors.kPrimaryColor,
                    width: 1.w,
                  ),
                ),
                contentPadding: EdgeInsets.all(10.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
