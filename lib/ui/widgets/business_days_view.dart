import 'package:dropdown_button2/dropdown_button2.dart'; // Ensure this package is imported
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../notifier/business_step_notifier.dart';
import '../themes/color_constants.dart';

class BusinessDaysView extends ConsumerWidget {
  const BusinessDaysView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Text(
              'Business Operating Days &\nHours',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.2,
              ),
            ),
            // Scrollable content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  // Operating Days Dropdown
                  Consumer(
                    builder: (context, ref, child) {
                      final state = ref.watch(businessStepProvider);
                      return DropdownButton2<String>(
                        hint: Text(
                          'Operating Days',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.greyColor,
                          ),
                        ),
                        value: state.selectedDay,
                        underline: SizedBox.shrink(),
                        items: _getDaysDropdownItems(),
                        onChanged: (value) {
                          ref
                              .read(businessStepProvider.notifier)
                              .updateSelectedDay(value);
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 50.h,
                          width:
                              double.infinity, // Height of the dropdown button
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                          ), // Horizontal padding for the button
                          decoration: BoxDecoration(
                            color: AppColors
                                .fieldfillColor, // Background color for the button
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(
                              color: Color(0xffB5B5B5),
                            ), // Border color
                          ),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200.h,
                          // Max height for the dropdown menu
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                          ), // Horizontal padding for dropdown items
                          decoration: BoxDecoration(
                            color: AppColors
                                .fieldfillColor, // Background color for the dropdown items
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(
                              color: Color(0xffB5B5B5),
                            ), // Border color
                          ),
                        ),
                        iconStyleData: IconStyleData(
                          icon: Icon(
                            Iconsax.arrow_down_1,
                            size: 20.sp,
                            color: Color(0xff292D32),
                          ),
                        ),
                      );
                      //   Container(
                      //   decoration: BoxDecoration(
                      //     color: AppColors.lightGreyColor,
                      //     borderRadius: BorderRadius.circular(12.r),
                      //     // border: Border.all(
                      //     //    color: AppColors.borderGreyColor,
                      //     //   ),
                      //   ),
                      //   child: DropdownButtonFormField<String>(
                      //     decoration: InputDecoration(
                      //       //  labelText: 'Operating Days',
                      //       border: InputBorder.none,
                      //       contentPadding: EdgeInsets.symmetric(
                      //         horizontal: 15.w,
                      //         vertical: 12.h,
                      //       ),
                      //       suffixIcon: Padding(
                      //         padding: EdgeInsets.only(right: 5.w),
                      //         child: Icon(
                      //           Iconsax.calendar_1,
                      //           size: 20.sp,
                      //           color: Color(0xff292D32),
                      //         ),
                      //       ),
                      //     ),
                      //     hint: Text(
                      //       'Operating Days',
                      //       style: TextStyle(
                      //         fontSize: 16.sp,
                      //         color: AppColors.greyColor,
                      //       ),
                      //     ),
                      //     value: state.selectedDay,
                      //     items: _getDaysDropdownItems(),
                      //     onChanged: (value) {
                      //       ref
                      //           .read(businessStepProvider.notifier)
                      //           .updateSelectedDay(value);
                      //     },
                      //   ),
                      // );
                    },
                  ),

                  SizedBox(height: 20.h),

                  // Time Selection Row
                  Row(
                    children: [
                      // Start Time
                      Expanded(
                        child: Consumer(
                          builder: (context, ref, child) {
                            final state = ref.watch(businessStepProvider);
                            return Container(
                              decoration: BoxDecoration(
                                color: AppColors.lightGreyColor,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                  color: AppColors.borderGreyColor,
                                ),
                              ),
                              child: InkWell(
                                onTap: () => _selectTime(context, ref, true),
                                borderRadius: BorderRadius.circular(12.r),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.w,
                                    vertical: 12.h,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.startTime != null
                                                  ? state.startTime!.format(
                                                      context,
                                                    )
                                                  : 'Start time',
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                color: state.startTime != null
                                                    ? AppColors.blackColor2
                                                    : AppColors.greyColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(Icons.access_time, size: 20.sp),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(width: 16.w),

                      // End Time
                      Expanded(
                        child: Consumer(
                          builder: (context, ref, child) {
                            final state = ref.watch(businessStepProvider);
                            return Container(
                              decoration: BoxDecoration(
                                color: AppColors.lightGreyColor,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                  color: AppColors.borderGreyColor,
                                ),
                              ),
                              child: InkWell(
                                onTap: () => _selectTime(context, ref, false),
                                borderRadius: BorderRadius.circular(12.r),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.w,
                                    vertical: 12.h,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.endTime != null
                                                  ? state.endTime!.format(
                                                      context,
                                                    )
                                                  : 'End time',
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                color: state.startTime != null
                                                    ? AppColors.blackColor2
                                                    : AppColors.greyColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(Icons.access_time, size: 20.sp),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),
                  // Add More Button
                  Consumer(
                    builder: (context, ref, child) {
                      final state = ref.watch(businessStepProvider);
                      final canAdd =
                          state.selectedDay != null &&
                          state.startTime != null &&
                          state.endTime != null;

                      return Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: canAdd
                              ? () => ref
                                    .read(businessStepProvider.notifier)
                                    .addBusinessHour()
                              : null,
                          child: Container(
                            width: 86.w,
                            height: 35.h,
                            decoration: BoxDecoration(
                              gradient: canAdd
                                  ? const LinearGradient(
                                      colors: [
                                        Color(0xFF3C70FF),
                                        Color(0xFF8FADFF),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    )
                                  : null,
                              color: canAdd ? null : Colors.grey[300],
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 5.h,
                                ),
                                child: Text(
                                  'Add More',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 24.h),
                  // Business Hours List
                  SizedBox(
                    height: 300.h,
                    width: double.infinity,
                    child: Consumer(
                      builder: (context, ref, child) {
                        final state = ref.watch(businessStepProvider);
                        if (state.businessHours.isEmpty) {
                          return SizedBox(
                            height: 100.h,
                            child: Center(
                              child: Text(
                                'No business hours added yet',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          );
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          //   physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.businessHours.length,
                          itemBuilder: (context, index) {
                            final hour = state.businessHours[index];
                            return Container(
                              margin: EdgeInsets.only(bottom: 12.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                  color: AppColors.kPrimaryColor,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            hour.day,
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF4A4A4A),
                                            ),
                                          ),
                                          SizedBox(height: 4.h),
                                          Text(
                                            'Start Time: ${hour.startTime.format(context)}',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Color(0xFF888888),
                                            ),
                                          ),
                                          Text(
                                            'End Time: ${hour.endTime.format(context)}',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Color(0xFF888888),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () => ref
                                          .read(businessStepProvider.notifier)
                                          .removeBusinessHour(index),
                                      icon: Icon(
                                        Iconsax.trash,
                                        color: Colors.red,
                                        size: 20.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  // Add bottom padding for better scrolling
                  //SizedBox(height: 100.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _getDaysDropdownItems() {
    final days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    return days.map((day) {
      return DropdownMenuItem<String>(
        value: day,
        child: Text(day, style: TextStyle(fontSize: 16.sp)),
      );
    }).toList();
  }

  Future<void> _selectTime(
    BuildContext context,
    WidgetRef ref,
    bool isStartTime,
  ) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Colors.white,
              hourMinuteShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              dayPeriodShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedTime != null) {
      if (isStartTime) {
        ref.read(businessStepProvider.notifier).updateStartTime(selectedTime);
      } else {
        ref.read(businessStepProvider.notifier).updateEndTime(selectedTime);
      }
    }
  }
}
