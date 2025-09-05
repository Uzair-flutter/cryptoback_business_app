import 'package:cryptoback_business_app/ui/notifier/new_campaign_notifiers.dart';
import 'package:cryptoback_business_app/utils/custom_font_style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../ui/themes/color_constants.dart';
import 'new_campaign.dart';

class CreateNewCampaign extends ConsumerWidget {
  final bool isEdit;
  const CreateNewCampaign({super.key, required this.isEdit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(campaignProvider);
    final notifier = ref.read(campaignProvider.notifier);

    if (isEdit) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Make sure we don't keep resetting every rebuild
        if (state.discountType == null &&
            notifier.titleController.text.isEmpty) {
          notifier.titleController.text = "Black Friday Sale";
          notifier.percentageController.text = "21";
          notifier.amountController.text = "110";
          notifier.cappedAmountController.text = "500";
          notifier.setDiscountType("Percentage");
          notifier.setUsageLimit("100");
          notifier.setStartTime(DateTime.now()); // Changed to DateTime.now()
          notifier.setEndTime(
            DateTime.now().add(Duration(days: 7)),
          ); // Changed to DateTime with 7 days ahead
        }
      });
    }
    return BottomSheet(
      onClosing: () {},
      showDragHandle: false,
      enableDrag: false,
      constraints: BoxConstraints(
        maxHeight: state.discountType != null ? 660.h : 590.h,
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
          child: Form(
            key: notifier.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Handle bar
                Container(
                  margin: EdgeInsets.only(top: 12.h),
                  width: 60.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),

                // Header
                Padding(
                  padding: EdgeInsets.all(20.w),
                  child: isEdit
                      ? black22w600center(data: 'Edit Campaign')
                      : black22w600center(data: 'Create New Campaign'),
                ),

                // Form content
                Expanded(
                  child: Padding(
                    // controller: scrollController,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SingleChildScrollView(
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
                            controller: notifier.titleController,
                            onChanged: notifier.setCampaignTitle,
                            decoration: InputDecoration(
                              hintText: 'Campaign Title',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Campaign title is required";
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 16.h),

                          // Discount Type dropdown
                          FormField<String>(
                            validator: (value) {
                              if (state.discountType == null ||
                                  state.discountType!.isEmpty) {
                                return "Please select a discount type";
                              }
                              return null;
                            },
                            builder: (field) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DropdownButton2<String>(
                                  hint: Text(
                                    'Select Discount Type',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: const Color(0xffB5B5B5),
                                    ),
                                  ),
                                  value: state.discountType,
                                  underline: const SizedBox.shrink(),
                                  items: ['Percentage', 'Amount']
                                      .map(
                                        (String item) =>
                                            DropdownMenuItem<String>(
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
                                  onChanged: (value) {
                                    notifier.setDiscountType(value);
                                    field.didChange(
                                      value,
                                    ); // 🔑 updates FormField state
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    height: 50.h,
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.fieldfillColor,
                                      borderRadius: BorderRadius.circular(14.r),
                                      border: Border.all(
                                        color: field.hasError
                                            ? AppColors.redColor
                                            : const Color(0xffB5B5B5),
                                      ),
                                    ),
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    offset: Offset(0, -8),
                                    maxHeight: 200.h,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.fieldfillColor,
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
                                if (field.hasError)
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 4.h,
                                      left: 4.w,
                                    ),
                                    child: Text(
                                      field.errorText!,
                                      style: TextStyle(
                                        color: AppColors.redColor,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),

                          // Conditional input field for Percentage
                          if (state.discountType == 'Percentage') ...[
                            SizedBox(height: 16.h),
                            TextFormField(
                              controller: notifier.percentageController,
                              onChanged: notifier.setPercentage,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Enter Percentage',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Percentage is required";
                                }
                                final num? val = num.tryParse(value);
                                if (val == null || val <= 0 || val > 100) {
                                  return "Enter valid percentage (1–100)";
                                }
                                return null;
                              },
                            ),
                          ],

                          // Conditional input field for Amount
                          if (state.discountType == 'Amount') ...[
                            SizedBox(height: 16.h),
                            TextFormField(
                              controller: notifier.amountController,
                              onChanged: notifier.setCappedAmount,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Enter Amount',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Amount is required";
                                }
                                final num? val = num.tryParse(value);
                                if (val == null || val <= 0) {
                                  return "Enter valid amount";
                                }
                                return null;
                              },
                            ),
                          ],

                          SizedBox(height: 16.h),

                          // Start Date and End Date fields
                          Row(
                            children: [
                              Expanded(
                                child:
                                    /// Start Date
                                    FormField<DateTime>(
                                      // Changed from TimeOfDay to DateTime
                                      validator: (value) {
                                        if (state.startTime == null) {
                                          return "Start date is required"; // Updated message
                                        }
                                        return null;
                                      },
                                      builder: (field) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              final picked = await showDatePicker(
                                                // Changed from showTimePicker to showDatePicker
                                                context: context,
                                                initialDate:
                                                    state.startTime ??
                                                    DateTime.now(), // Changed initial parameter
                                                firstDate:
                                                    DateTime.now(), // Added firstDate
                                                lastDate: DateTime.now().add(
                                                  Duration(days: 365),
                                                ), // Added lastDate
                                              );
                                              if (picked != null) {
                                                notifier.setStartTime(picked);
                                                field.didChange(
                                                  picked,
                                                ); // ✅ updates validator state
                                              }
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 16.w,
                                                vertical: 15.h,
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppColors.fieldfillColor,
                                                border: Border.all(
                                                  color: field.hasError
                                                      ? AppColors.redColor
                                                      : AppColors
                                                            .borderGreyColor,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(14.r),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    state.startTime != null
                                                        ? "${state.startTime!.day}/${state.startTime!.month}/${state.startTime!.year}" // Changed formatting to date
                                                        : "Start Time", // Updated placeholder text
                                                    style: GoogleFonts.montserrat(
                                                      fontSize: 14.sp,
                                                      color:
                                                          state.startTime !=
                                                              null
                                                          ? AppColors
                                                                .blackColor2
                                                          : AppColors
                                                                .borderGreyColor,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Icon(
                                                    Iconsax
                                                        .calendar_1, // Changed from access_time to calendar_today
                                                    color: AppColors
                                                        .borderGreyColor,
                                                    size: 20.sp,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          if (field.errorText != null)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 4,
                                              ),
                                              child: Text(
                                                field.errorText!,
                                                style: TextStyle(
                                                  color: AppColors.redColor,
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: FormField<DateTime>(
                                  // Changed from TimeOfDay to DateTime
                                  validator: (value) {
                                    if (state.endTime == null) {
                                      return "End date is required"; // Updated message
                                    }
                                    return null;
                                  },
                                  builder: (field) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          final picked = await showDatePicker(
                                            // Changed from showTimePicker to showDatePicker
                                            context: context,
                                            initialDate:
                                                state.endTime ??
                                                DateTime.now().add(
                                                  Duration(days: 1),
                                                ), // Changed initial parameter
                                            firstDate:
                                                state.startTime ??
                                                DateTime.now(), // Added firstDate based on start date
                                            lastDate: DateTime.now().add(
                                              Duration(days: 365),
                                            ), // Added lastDate
                                          );
                                          if (picked != null) {
                                            notifier.setEndTime(picked);
                                            field.didChange(picked);
                                          }
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 16.w,
                                            vertical: 15.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.fieldfillColor,
                                            border: Border.all(
                                              color: field.hasError
                                                  ? AppColors.redColor
                                                  : AppColors.borderGreyColor,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              14.r,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                state.endTime != null
                                                    ? "${state.endTime!.day}/${state.endTime!.month}/${state.endTime!.year}" // Changed formatting to date
                                                    : "End Time", // Updated placeholder text
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 14.sp,
                                                  color: state.endTime != null
                                                      ? AppColors.blackColor2
                                                      : AppColors
                                                            .borderGreyColor,
                                                ),
                                              ),
                                              Spacer(),
                                              Icon(
                                                Iconsax
                                                    .calendar_1, // Changed from access_time to calendar_today
                                                color:
                                                    AppColors.borderGreyColor,
                                                size: 20.sp,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      if (field.errorText != null)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 4,
                                          ),
                                          child: Text(
                                            field.errorText!,
                                            style: TextStyle(
                                              color: AppColors.redColor,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 16.h),

                          // Usage Limit dropdown
                          FormField<String>(
                            validator: (value) {
                              if (state.usageLimit == null ||
                                  state.usageLimit!.isEmpty) {
                                return "Please select a usage limit";
                              }
                              return null;
                            },
                            builder: (field) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DropdownButton2<String>(
                                  hint: Text(
                                    'Usage Limit',
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  value: state.usageLimit,
                                  underline: const SizedBox.shrink(),
                                  items: ['Unlimited', '100', '500', '1000']
                                      .map(
                                        (String item) =>
                                            DropdownMenuItem<String>(
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
                                  onChanged: (value) {
                                    notifier.setUsageLimit(value);
                                    field.didChange(value);
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    height: 50.h,
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.fieldfillColor,
                                      borderRadius: BorderRadius.circular(14.r),
                                      border: Border.all(
                                        color: field.hasError
                                            ? AppColors.redColor
                                            : AppColors.borderGreyColor,
                                      ),
                                    ),
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    offset: Offset(0, -8),
                                    maxHeight: 200.h,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.fieldfillColor,
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
                                if (field.hasError)
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 4.h,
                                      left: 4.w,
                                    ),
                                    child: Text(
                                      field.errorText!,
                                      style: TextStyle(
                                        color: AppColors.redColor,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),

                          SizedBox(height: 16.h),

                          // Capped Amount field
                          TextFormField(
                            controller: notifier.cappedAmountController,
                            onChanged: notifier.setCappedAmount,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Capped Amount',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Amount is required";
                              }
                              final num? val = num.tryParse(value);
                              if (val == null || val <= 0) {
                                return "Enter valid amount";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30.h),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (notifier.formKey.currentState!
                                        .validate()) {
                                      Navigator.pop(context);
                                      // Handle Mark as Done
                                      await showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        //  backgroundColor: Colors.,
                                        builder: (context) =>
                                            NewCampaignBottomSheet(),
                                      );

                                      debugPrint('Campaign Created');
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.kPrimaryColor,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 16.h,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14.r),
                                    ),
                                  ),
                                  child: Text(
                                    isEdit ? "Save" : 'Mark as Done',
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
                                    // Handle Cancel
                                    Navigator.pop(context);
                                  },
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: AppColors.redColor,
                                    side: const BorderSide(
                                      color: AppColors.redColor,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 16.h,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14.r),
                                    ),
                                  ),
                                  child: Text(
                                    isEdit ? "Delete" : 'Cancel',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // SizedBox(height: 30.h),
                        ],
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child:
                // ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }
}

// class CreateNewCampaign extends ConsumerWidget {
//   final bool isEdit;
//   const CreateNewCampaign({super.key, required this.isEdit});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(campaignProvider);
//     final notifier = ref.read(campaignProvider.notifier);
//
//     if (isEdit) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         // Make sure we don't keep resetting every rebuild
//         if (state.discountType == null &&
//             notifier.titleController.text.isEmpty) {
//           notifier.titleController.text = "Black Friday Sale";
//           notifier.percentageController.text = "21";
//           notifier.amountController.text = "110";
//           notifier.cappedAmountController.text = "500";
//           notifier.setDiscountType("Percentage");
//           notifier.setUsageLimit("100");
//           notifier.setStartTime(
//             const TimeOfDay(hour: 0, minute: 0),
//           ); // 12:00 AM
//           notifier.setEndTime(const TimeOfDay(hour: 12, minute: 0)); // 12:00 PM
//         }
//       });
//     }
//     return BottomSheet(
//       onClosing: () {},
//       showDragHandle: false,
//       enableDrag: false,
//       constraints: BoxConstraints(
//         maxHeight: state.discountType != null ? 660.h : 590.h,
//       ),
//       builder: (context) {
//         return Container(
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.95),
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 10,
//                 spreadRadius: 0,
//                 offset: const Offset(0, -2),
//               ),
//             ],
//           ),
//           child: Form(
//             key: notifier.formKey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Handle bar
//                 Container(
//                   margin: EdgeInsets.only(top: 12.h),
//                   width: 60.w,
//                   height: 6.h,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[300],
//                     borderRadius: BorderRadius.circular(2.r),
//                   ),
//                 ),
//
//                 // Header
//                 Padding(
//                   padding: EdgeInsets.all(20.w),
//                   child: isEdit
//                       ? black22w600center(data: 'Edit Campaign')
//                       : black22w600center(data: 'Create New Campaign'),
//                 ),
//
//                 // Form content
//                 Expanded(
//                   child: Padding(
//                     // controller: scrollController,
//                     padding: EdgeInsets.symmetric(horizontal: 20.w),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Campaign ID field (read-only)
//                           Container(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 16.w,
//                               vertical: 15.h,
//                             ),
//                             decoration: BoxDecoration(
//                               color: AppColors.textFeildReadOnly,
//                               borderRadius: BorderRadius.circular(14.r),
//                             ),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: black14w400center(data: '14545554'),
//                                 ),
//                               ],
//                             ),
//                           ),
//
//                           SizedBox(height: 16.h),
//
//                           // Campaign Title field
//                           TextFormField(
//                             controller: notifier.titleController,
//                             onChanged: notifier.setCampaignTitle,
//                             decoration: InputDecoration(
//                               hintText: 'Campaign Title',
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return "Campaign title is required";
//                               }
//                               return null;
//                             },
//                           ),
//
//                           SizedBox(height: 16.h),
//
//                           // Discount Type dropdown
//                           FormField<String>(
//                             validator: (value) {
//                               if (state.discountType == null ||
//                                   state.discountType!.isEmpty) {
//                                 return "Please select a discount type";
//                               }
//                               return null;
//                             },
//                             builder: (field) => Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 DropdownButton2<String>(
//                                   hint: Text(
//                                     'Select Discount Type',
//                                     style: TextStyle(
//                                       fontSize: 16.sp,
//                                       color: const Color(0xffB5B5B5),
//                                     ),
//                                   ),
//                                   value: state.discountType,
//                                   underline: const SizedBox.shrink(),
//                                   items: ['Percentage', 'Amount']
//                                       .map(
//                                         (String item) =>
//                                             DropdownMenuItem<String>(
//                                               value: item,
//                                               child: Text(
//                                                 item,
//                                                 style: GoogleFonts.montserrat(
//                                                   fontSize: 14.sp,
//                                                 ),
//                                               ),
//                                             ),
//                                       )
//                                       .toList(),
//                                   onChanged: (value) {
//                                     notifier.setDiscountType(value);
//                                     field.didChange(
//                                       value,
//                                     ); // 🔑 updates FormField state
//                                   },
//                                   buttonStyleData: ButtonStyleData(
//                                     height: 50.h,
//                                     width: double.infinity,
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: 15.w,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       color: AppColors.fieldfillColor,
//                                       borderRadius: BorderRadius.circular(14.r),
//                                       border: Border.all(
//                                         color: field.hasError
//                                             ? AppColors.redColor
//                                             : const Color(0xffB5B5B5),
//                                       ),
//                                     ),
//                                   ),
//                                   dropdownStyleData: DropdownStyleData(
//                                     offset: Offset(0, -8),
//                                     maxHeight: 200.h,
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: 15.w,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       color: AppColors.fieldfillColor,
//                                       borderRadius: BorderRadius.circular(14.r),
//                                       border: Border.all(
//                                         color: AppColors.borderGreyColor,
//                                       ),
//                                     ),
//                                   ),
//                                   iconStyleData: IconStyleData(
//                                     icon: Padding(
//                                       padding: EdgeInsets.only(right: 5.w),
//                                       child: Icon(
//                                         Icons.keyboard_arrow_down,
//                                         size: 20.sp,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 if (field.hasError)
//                                   Padding(
//                                     padding: EdgeInsets.only(
//                                       top: 4.h,
//                                       left: 4.w,
//                                     ),
//                                     child: Text(
//                                       field.errorText!,
//                                       style: TextStyle(
//                                         color: AppColors.redColor,
//                                         fontSize: 12.sp,
//                                       ),
//                                     ),
//                                   ),
//                               ],
//                             ),
//                           ),
//
//                           // Conditional input field for Percentage
//                           if (state.discountType == 'Percentage') ...[
//                             SizedBox(height: 16.h),
//                             TextFormField(
//                               controller: notifier.percentageController,
//                               onChanged: notifier.setPercentage,
//                               keyboardType: TextInputType.number,
//                               decoration: InputDecoration(
//                                 hintText: 'Enter Percentage',
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return "Percentage is required";
//                                 }
//                                 final num? val = num.tryParse(value);
//                                 if (val == null || val <= 0 || val > 100) {
//                                   return "Enter valid percentage (1–100)";
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ],
//
//                           // Conditional input field for Amount
//                           if (state.discountType == 'Amount') ...[
//                             SizedBox(height: 16.h),
//                             TextFormField(
//                               controller: notifier.amountController,
//                               onChanged: notifier.setCappedAmount,
//                               keyboardType: TextInputType.number,
//                               decoration: InputDecoration(
//                                 hintText: 'Enter Amount',
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return "Amount is required";
//                                 }
//                                 final num? val = num.tryParse(value);
//                                 if (val == null || val <= 0) {
//                                   return "Enter valid amount";
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ],
//
//                           SizedBox(height: 16.h),
//
//                           // Start Time and End Time fields
//                           Row(
//                             children: [
//                               Expanded(
//                                 child:
//                                     /// Start Time
//                                     FormField<TimeOfDay>(
//                                       validator: (value) {
//                                         if (state.startTime == null) {
//                                           return "Start time is required";
//                                         }
//                                         return null;
//                                       },
//                                       builder: (field) => Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           GestureDetector(
//                                             onTap: () async {
//                                               final picked =
//                                                   await showTimePicker(
//                                                     context: context,
//                                                     initialTime:
//                                                         TimeOfDay.now(),
//                                                   );
//                                               if (picked != null) {
//                                                 notifier.setStartTime(picked);
//                                                 field.didChange(
//                                                   picked,
//                                                 ); // ✅ updates validator state
//                                               }
//                                             },
//                                             child: Container(
//                                               padding: EdgeInsets.symmetric(
//                                                 horizontal: 16.w,
//                                                 vertical: 15.h,
//                                               ),
//                                               decoration: BoxDecoration(
//                                                 color: AppColors.fieldfillColor,
//                                                 border: Border.all(
//                                                   color: field.hasError
//                                                       ? AppColors.redColor
//                                                       : AppColors
//                                                             .borderGreyColor,
//                                                 ),
//                                                 borderRadius:
//                                                     BorderRadius.circular(14.r),
//                                               ),
//                                               child: Row(
//                                                 children: [
//                                                   Text(
//                                                     state.startTime != null
//                                                         ? state.startTime!
//                                                               .format(context)
//                                                         : "Select Start Time",
//                                                     style: GoogleFonts.montserrat(
//                                                       fontSize: 14.sp,
//                                                       color:
//                                                           state.startTime !=
//                                                                   null &&
//                                                               state.startTime
//                                                                   is TimeOfDay
//                                                           ? AppColors
//                                                                 .blackColor2
//                                                           : AppColors
//                                                                 .borderGreyColor,
//                                                     ),
//                                                   ),
//                                                   Spacer(),
//                                                   Icon(
//                                                     Icons.access_time,
//                                                     color: AppColors
//                                                         .borderGreyColor,
//                                                     size: 20.sp,
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                           if (field.errorText != null)
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                 top: 4,
//                                               ),
//                                               child: Text(
//                                                 field.errorText!,
//                                                 style: TextStyle(
//                                                   color: AppColors.redColor,
//                                                   fontSize: 12.sp,
//                                                 ),
//                                               ),
//                                             ),
//                                         ],
//                                       ),
//                                     ),
//                               ),
//                               SizedBox(width: 16.w),
//                               Expanded(
//                                 child: FormField<TimeOfDay>(
//                                   validator: (value) {
//                                     if (state.endTime == null) {
//                                       return "Start time is required";
//                                     }
//                                     return null;
//                                   },
//                                   builder: (field) => Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       GestureDetector(
//                                         onTap: () async {
//                                           final picked = await showTimePicker(
//                                             context: context,
//                                             initialTime: TimeOfDay.now(),
//                                           );
//                                           if (picked != null) {
//                                             notifier.setEndTime(picked);
//                                             field.didChange(
//                                               picked,
//                                             ); // ✅ updates validator state
//                                           }
//                                         },
//                                         child: Container(
//                                           padding: EdgeInsets.symmetric(
//                                             horizontal: 16.w,
//                                             vertical: 15.h,
//                                           ),
//                                           decoration: BoxDecoration(
//                                             color: AppColors.fieldfillColor,
//                                             border: Border.all(
//                                               color: field.hasError
//                                                   ? AppColors.redColor
//                                                   : AppColors.borderGreyColor,
//                                             ),
//                                             borderRadius: BorderRadius.circular(
//                                               14.r,
//                                             ),
//                                           ),
//                                           child: Row(
//                                             children: [
//                                               Text(
//                                                 state.endTime != null
//                                                     ? state.endTime!.format(
//                                                         context,
//                                                       )
//                                                     : "Select End Time",
//                                                 style: GoogleFonts.montserrat(
//                                                   fontSize: 14.sp,
//                                                   color:
//                                                       state.endTime != null &&
//                                                           state.endTime
//                                                               is TimeOfDay
//                                                       ? AppColors.blackColor2
//                                                       : AppColors
//                                                             .borderGreyColor,
//                                                 ),
//                                               ),
//                                               Spacer(),
//                                               Icon(
//                                                 Icons.access_time,
//                                                 color:
//                                                     AppColors.borderGreyColor,
//                                                 size: 20.sp,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       if (field.errorText != null)
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                             top: 4,
//                                           ),
//                                           child: Text(
//                                             field.errorText!,
//                                             style: TextStyle(
//                                               color: AppColors.redColor,
//                                               fontSize: 12.sp,
//                                             ),
//                                           ),
//                                         ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                           SizedBox(height: 16.h),
//
//                           // Usage Limit dropdown
//                           FormField<String>(
//                             validator: (value) {
//                               if (state.usageLimit == null ||
//                                   state.usageLimit!.isEmpty) {
//                                 return "Please select a usage limit";
//                               }
//                               return null;
//                             },
//                             builder: (field) => Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 DropdownButton2<String>(
//                                   hint: Text(
//                                     'Usage Limit',
//                                     style: TextStyle(fontSize: 16.sp),
//                                   ),
//                                   value: state.usageLimit,
//                                   underline: const SizedBox.shrink(),
//                                   items: ['Unlimited', '100', '500', '1000']
//                                       .map(
//                                         (String item) =>
//                                             DropdownMenuItem<String>(
//                                               value: item,
//                                               child: Text(
//                                                 item,
//                                                 style: GoogleFonts.montserrat(
//                                                   fontSize: 14.sp,
//                                                 ),
//                                               ),
//                                             ),
//                                       )
//                                       .toList(),
//                                   onChanged: (value) {
//                                     notifier.setUsageLimit(value);
//                                     field.didChange(value);
//                                   },
//                                   buttonStyleData: ButtonStyleData(
//                                     height: 50.h,
//                                     width: double.infinity,
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: 15.w,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       color: AppColors.fieldfillColor,
//                                       borderRadius: BorderRadius.circular(14.r),
//                                       border: Border.all(
//                                         color: field.hasError
//                                             ? AppColors.redColor
//                                             : AppColors.borderGreyColor,
//                                       ),
//                                     ),
//                                   ),
//                                   dropdownStyleData: DropdownStyleData(
//                                     offset: Offset(0, -8),
//                                     maxHeight: 200.h,
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: 15.w,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       color: AppColors.fieldfillColor,
//                                       borderRadius: BorderRadius.circular(14.r),
//                                       border: Border.all(
//                                         color: AppColors.borderGreyColor,
//                                       ),
//                                     ),
//                                   ),
//                                   iconStyleData: IconStyleData(
//                                     icon: Padding(
//                                       padding: EdgeInsets.only(right: 5.w),
//                                       child: Icon(
//                                         Icons.keyboard_arrow_down,
//                                         size: 20.sp,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 if (field.hasError)
//                                   Padding(
//                                     padding: EdgeInsets.only(
//                                       top: 4.h,
//                                       left: 4.w,
//                                     ),
//                                     child: Text(
//                                       field.errorText!,
//                                       style: TextStyle(
//                                         color: AppColors.redColor,
//                                         fontSize: 12.sp,
//                                       ),
//                                     ),
//                                   ),
//                               ],
//                             ),
//                           ),
//
//                           SizedBox(height: 16.h),
//
//                           // Capped Amount field
//                           TextFormField(
//                             controller: notifier.cappedAmountController,
//                             onChanged: notifier.setCappedAmount,
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(
//                               hintText: 'Capped Amount',
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return "Amount is required";
//                               }
//                               final num? val = num.tryParse(value);
//                               if (val == null || val <= 0) {
//                                 return "Enter valid amount";
//                               }
//                               return null;
//                             },
//                           ),
//                           SizedBox(height: 30.h),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: ElevatedButton(
//                                   onPressed: () async {
//                                     if (notifier.formKey.currentState!
//                                         .validate()) {
//                                       Navigator.pop(context);
//                                       // Handle Mark as Done
//                                       await showModalBottomSheet(
//                                         context: context,
//                                         isScrollControlled: true,
//                                         //  backgroundColor: Colors.,
//                                         builder: (context) =>
//                                             NewCampaignBottomSheet(),
//                                       );
//
//                                       debugPrint('Campaign Created');
//                                     }
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: AppColors.kPrimaryColor,
//                                     foregroundColor: Colors.white,
//                                     padding: EdgeInsets.symmetric(
//                                       vertical: 16.h,
//                                     ),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(14.r),
//                                     ),
//                                   ),
//                                   child: Text(
//                                     isEdit ? "Save" : 'Mark as Done',
//                                     style: GoogleFonts.montserrat(
//                                       fontSize: 16.sp,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(width: 16.w),
//                               Expanded(
//                                 child: OutlinedButton(
//                                   onPressed: () {
//                                     // Handle Cancel
//                                     Navigator.pop(context);
//                                   },
//                                   style: OutlinedButton.styleFrom(
//                                     foregroundColor: AppColors.redColor,
//                                     side: const BorderSide(
//                                       color: AppColors.redColor,
//                                     ),
//                                     padding: EdgeInsets.symmetric(
//                                       vertical: 16.h,
//                                     ),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(14.r),
//                                     ),
//                                   ),
//                                   child: Text(
//                                     isEdit ? "Delete" : 'Cancel',
//                                     style: GoogleFonts.montserrat(
//                                       fontSize: 16.sp,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                           // SizedBox(height: 30.h),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Padding(
//                 //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 //   child:
//                 // ),
//                 SizedBox(height: 20.h),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
