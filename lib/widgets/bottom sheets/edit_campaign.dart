import 'package:cryptoback_business_app/utils/custom_font_style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ui/themes/color_constants.dart';

class EditCampaign extends StatefulWidget {
  const EditCampaign({super.key});

  @override
  State<EditCampaign> createState() => _EditCampaignState();
}

class _EditCampaignState extends State<EditCampaign> {
  final TextEditingController _campaignTitleController = TextEditingController(
    text: 'Black Friday Sale',
  );
  final TextEditingController _cappedAmountController = TextEditingController(
    text: '\$110',
  );
  final TextEditingController _percentageController = TextEditingController(
    text: '21%',
  );

  String? selectedDiscountType = 'Percentage';
  String? selectedUsageLimit = '50';
  TimeOfDay? startTime = const TimeOfDay(hour: 12, minute: 0);
  TimeOfDay? endTime = const TimeOfDay(hour: 12, minute: 0);

  final List<String> discountTypes = ['Percentage', 'Amount'];
  final List<String> usageLimits = [
    'Unlimited',
    '50',
    '100',
    '500',
    '1000',
    '5000',
  ];

  @override
  void dispose() {
    _campaignTitleController.dispose();
    _cappedAmountController.dispose();
    _percentageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      showDragHandle: false,
      enableDrag: false,
      constraints: BoxConstraints(
        maxHeight: selectedDiscountType != null ? 660.h : 590.h,
      ),
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                margin: EdgeInsets.only(top: 12.h),
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),

              // Header
              Padding(
                padding: EdgeInsets.all(20.w),
                child: black22w600center(data: 'Edit Campaign'),
              ),

              // Form content
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Campaign ID field (read-only)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 15.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.textFeildReadOnly,
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: black14w400center(data: '14545554'),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 16.h),

                      // Campaign Title field
                      TextFormField(
                        controller: _campaignTitleController,
                        decoration: InputDecoration(hintText: 'Campaign Title'),
                      ),

                      SizedBox(height: 16.h),

                      // Discount Type dropdown
                      DropdownButton2<String>(
                        hint: Text(
                          'Select Discount Type',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: const Color(0xffB5B5B5),
                          ),
                        ),
                        value: selectedDiscountType,
                        underline: SizedBox.shrink(),
                        items: discountTypes
                            .map(
                              (String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (String? value) {
                          setState(() {
                            selectedDiscountType = value;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 50.h,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: AppColors.fieldfillColor,
                            // change to your desired color or AppColors.fieldfillColor,
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(color: const Color(0xffB5B5B5)),
                          ),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200.h,
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: AppColors.fieldfillColor,
                            // change to your desired color or AppColors.fieldfillColor,
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(
                              color: AppColors.borderGreyColor,
                            ),
                          ),
                        ),
                        iconStyleData: IconStyleData(
                          icon: Padding(
                            padding: EdgeInsets.only(right: 5.w),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 20.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      // Conditional input field for Percentage
                      if (selectedDiscountType == 'Percentage') ...[
                        SizedBox(height: 16.h),
                        TextFormField(
                          controller: _percentageController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter Percentage',
                          ),
                        ),
                      ],

                      // Conditional input field for Amount
                      if (selectedDiscountType == 'Amount') ...[
                        SizedBox(height: 16.h),
                        TextFormField(
                          controller: _cappedAmountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText: 'Enter Amount'),
                        ),
                      ],

                      SizedBox(height: 16.h),

                      // Start Time and End Time fields
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                try {
                                  final TimeOfDay? picked =
                                      await showTimePicker(
                                        context: context,
                                        initialTime:
                                            startTime ?? TimeOfDay.now(),
                                      );
                                  if (picked != null) {
                                    setState(() {
                                      startTime = picked;
                                    });
                                  }
                                } catch (e) {
                                  print('Error showing time picker: $e');
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 15.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.fieldfillColor,
                                  borderRadius: BorderRadius.circular(14.r),
                                  border: Border.all(
                                    color: AppColors.borderGreyColor,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        startTime != null &&
                                                startTime is TimeOfDay
                                            ? '${startTime!.hour.toString().padLeft(2, '0')}:${startTime!.minute.toString().padLeft(2, '0')} Am'
                                            : 'Start Time',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14.sp,
                                          color:
                                              startTime != null &&
                                                  startTime is TimeOfDay
                                              ? AppColors.blackColor2
                                              : AppColors.borderGreyColor,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.access_time,
                                      color: AppColors.borderGreyColor,
                                      size: 20.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                try {
                                  final TimeOfDay? picked =
                                      await showTimePicker(
                                        context: context,
                                        initialTime: endTime ?? TimeOfDay.now(),
                                      );
                                  if (picked != null) {
                                    setState(() {
                                      endTime = picked;
                                    });
                                  }
                                } catch (e) {
                                  print('Error showing time picker: $e');
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 15.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.fieldfillColor,
                                  borderRadius: BorderRadius.circular(14.r),
                                  border: Border.all(
                                    color: AppColors.borderGreyColor,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        endTime != null && endTime is TimeOfDay
                                            ? '${endTime!.hour.toString().padLeft(2, '0')}:${endTime!.minute.toString().padLeft(2, '0')} Pm'
                                            : 'End Time',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14.sp,
                                          color:
                                              endTime != null &&
                                                  endTime is TimeOfDay
                                              ? AppColors.blackColor2
                                              : AppColors.borderGreyColor,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.access_time,
                                      color: AppColors.borderGreyColor,
                                      size: 20.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 16.h),

                      // Usage Limit dropdown
                      DropdownButton2<String>(
                        hint: Text(
                          'Usage Limit',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        value: selectedUsageLimit,
                        underline: SizedBox.shrink(),
                        items: usageLimits
                            .map(
                              (String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (String? value) {
                          setState(() {
                            selectedUsageLimit = value;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 50.h,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: AppColors.fieldfillColor,
                            // Or your custom color
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(
                              color: AppColors.borderGreyColor,
                            ),
                          ),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200.h,
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: AppColors.fieldfillColor,
                            // Or your custom color
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(
                              color: AppColors.borderGreyColor,
                            ),
                          ),
                        ),
                        iconStyleData: IconStyleData(
                          icon: Padding(
                            padding: EdgeInsets.only(right: 5.w),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 20.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 16.h),

                      // Capped Amount field
                      TextFormField(
                        controller: _cappedAmountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(hintText: 'Capped Amount'),
                      ),

                      SizedBox(height: 30.h),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle Save
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.kPrimaryColor,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14.r),
                                ),
                              ),
                              child: Text(
                                'Save',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                // Handle Delete
                                Navigator.pop(context);
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.redColor,
                                side: const BorderSide(
                                  color: AppColors.redColor,
                                ),
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14.r),
                                ),
                              ),
                              child: Text(
                                'Delete',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      selectedDiscountType != null
                          ? SizedBox(height: 20.h)
                          : SizedBox(height: 20.h),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
