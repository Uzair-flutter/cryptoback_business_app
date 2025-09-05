// ui/screens/business_setup_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../notifier/business_step_notifier.dart';
import '../themes/color_constants.dart';
import '../widgets/add_store_locations_view.dart';
import '../widgets/business_days_view.dart';
import '../widgets/category_selection_view.dart';
import '../widgets/describe_business_view.dart';
import '../widgets/qr_code_view.dart';
import '../widgets/upload_logo_view.dart';

class BusinessStep extends ConsumerWidget {
  const BusinessStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final businessState = ref.watch(businessStepProvider);
    final businessNotifier = ref.read(businessStepProvider.notifier);
    late PageController pageController;
    // Initialize PageController with current step
    pageController = PageController(initialPage: businessState.currentStep!);

    void handleNextButton(BuildContext context) {
      // Validate current step
      if (!businessNotifier.validateCurrentStep()) {
        String? errorMessage = businessNotifier.getValidationErrorMessage();
        if (errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
          );
        }
        return;
      }

      // Move to next step if not at the last step
      if (businessState.currentStep! < 4) {
        businessNotifier.nextStep();
        pageController.animateToPage(
          businessState.currentStep! + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        // Navigate to QR Code view when index is 4
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QrCodeView()),
        );
      }
    }

    void handleBackButton() {
      if (businessState.currentStep! > 0) {
        businessNotifier.previousStep();
        pageController.animateToPage(
          businessState.currentStep! - 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const SizedBox(),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w, top: 10.h),
            child: ElevatedButton(
              // onPressed: () => handleSaveAndDraft(
              //   context,
              //   ref.read(dummyProvider).selectedCategory,
              // ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              ),
              child: Text(
                'Save & Draft',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            child: Row(
              children: List.generate(5, (index) {
                return Expanded(
                  child: Container(
                    height: 4.h,
                    margin: EdgeInsets.only(right: index == 4 ? 0 : 8.w),
                    decoration: BoxDecoration(
                      color: index <= businessState.currentStep!
                          ? const Color(0xFF5B7FFF)
                          : const Color(0xFFE5E7EB),
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                );
              }),
            ),
          ),

          // Step indicator text
          Expanded(
            child: PageView(
              controller: pageController,
              physics:
                  const NeverScrollableScrollPhysics(), // Disable manual scrolling
              onPageChanged: (index) {
                // Update current step when page changes
                businessNotifier.setCurrentStep(index);
              },
              children: [
                CategorySelectionView(),
                DescribeBusiness(),
                UploadLogoView(),
                BusinessDaysView(),
                AddStoreLocationsView(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Show Back button only if currentStep > 0
                if (businessState.currentStep! > 0)
                  OutlinedButton(
                    onPressed: handleBackButton,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: AppColors.kPrimaryColor,
                        width: 1.w,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 16.h,
                        horizontal: 0,
                      ),
                      minimumSize: Size(102.w, 40.h),
                    ),
                    child: Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ),
                // Only show SizedBox for spacing if currentStep > 0
                // Always show the "Next" or "Finish" button
                if (businessState.currentStep! > 0)
                  ElevatedButton(
                    onPressed: () {
                      handleNextButton(context);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(102.w, 40.h),
                      backgroundColor: AppColors.kPrimaryColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 16.h,
                        horizontal: 0,
                      ),
                    ),
                    child: Text(
                      businessState.currentStep == 4 ? 'Finish' : 'Next',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                if (businessState.currentStep! == 0)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        handleNextButton(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kPrimaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 16.h,
                          horizontal: 0,
                        ),
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ), // Placeholder for alignment
              ],
            ),
          ),

          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}

// class BusinessStep extends ConsumerWidget {
//   int currentStep = 0;
//   BusinessStep({super.key});
//
//   void _handleSaveAndDraft(BuildContext context, String? selectedCategory) {
//     // Validate if a category is selected
//     if (selectedCategory == null) {
//       // Show snackbar or dialog to inform user to select a category
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Please select a business category'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }
//
//     // Move to next step if not at the last step
//     if (currentStep < 4) {
//       currentStep++;
//
//       // Navigate to next screen based on current step
//       _navigateToNextScreen();
//     } else {
//       // Handle completion of all steps
//       _handleCompletion(context);
//     }
//   }
//
//   void _navigateToNextScreen() {
//     // Navigate to different screens based on current step
//     switch (currentStep) {
//       case 1:
//         // Navigate to Step 2 screen
//         // Navigator.pushNamed(context, '/step2');
//         print('Navigate to Step 2');
//         break;
//       case 2:
//         // Navigate to Step 3 screen
//         // Navigator.pushNamed(context, '/step3');
//         print('Navigate to Step 3');
//         break;
//       case 3:
//         // Navigate to Step 4 screen
//         // Navigator.pushNamed(context, '/step4');
//         print('Navigate to Step 4');
//         break;
//       case 4:
//         // Navigate to Step 5 screen
//         // Navigator.pushNamed(context, '/step5');
//         print('Navigate to Step 5');
//         break;
//     }
//   }
//
//   void _handleCompletion(BuildContext context) {
//     // Handle completion of all 6 steps
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('All steps completed!'),
//         backgroundColor: Colors.green,
//       ),
//     );
//     // Navigate to final screen or home
//     // Navigator.pushReplacementNamed(context, '/home');
//   }
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   // Set initial selected category
//   //   // selectedCategory = categories.firstWhere((cat) => cat.isSelected).title;
//   // }
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: const SizedBox(),
//         actions: [
//           Padding(
//             padding: EdgeInsets.only(right: 20.w, top: 10.h),
//             child: ElevatedButton(
//               onPressed: () => _handleSaveAndDraft(
//                 context,
//                 ref.read(dummyProvider).selectedCategory,
//               ),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.kPrimaryColor,
//                 foregroundColor: Colors.white,
//                 elevation: 0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.r),
//                 ),
//                 padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//               ),
//               child: Text(
//                 'Save & Draft',
//                 style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
//             child: Row(
//               children: List.generate(5, (index) {
//                 return Expanded(
//                   child: Container(
//                     height: 4.h,
//                     margin: EdgeInsets.only(right: index == 4 ? 0 : 8.w),
//                     decoration: BoxDecoration(
//                       color: index <= currentStep
//                           ? const Color(0xFF5B7FFF)
//                           : const Color(0xFFE5E7EB),
//                       borderRadius: BorderRadius.circular(2.r),
//                     ),
//                   ),
//                 );
//               }),
//             ),
//           ),
//
//           // Step indicator text
//           Expanded(
//             child: PageView(
//               children: [
//                 CategorySelectionView(),
//                 DescribeBusiness(),
//                 UploadLogoView(),
//                 BusinessDaysView(),
//                 AddStoreLocationsView(),
//               ],
//             ),
//           ),
//           Row(
//             children: [
//               SizedBox(width: 24.w),
//               if (currentStep > 0)
//                 Expanded(
//                   child: OutlinedButton(
//                     onPressed: () {
//                       if (currentStep > 0) {
//                         currentStep--;
//                         _navigateToNextScreen();
//                       }
//                     },
//                     style: OutlinedButton.styleFrom(
//                       side: BorderSide(
//                         color: const Color(0xFF9CA3AF),
//                         width: 1.w,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.r),
//                       ),
//                       padding: EdgeInsets.symmetric(
//                         vertical: 16.h,
//                         horizontal: 0,
//                       ),
//                     ),
//                     child: Text(
//                       'Back',
//                       style: TextStyle(
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w500,
//                         color: const Color(0xFF374151),
//                       ),
//                     ),
//                   ),
//                 ),
//               if (currentStep > 0) SizedBox(width: 16.w),
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _handleSaveAndDraft(
//                       context,
//                       ref.read(dummyProvider).selectedCategory,
//                     );
//                     if (currentStep == 4) {}
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.kPrimaryColor,
//                     foregroundColor: Colors.white,
//                     elevation: 0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.r),
//                     ),
//                     padding: EdgeInsets.symmetric(
//                       vertical: 16.h,
//                       horizontal: 0,
//                     ),
//                   ),
//                   child: Text(
//                     currentStep == 4 ? 'Finish' : 'Next',
//                     style: TextStyle(
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 24.w),
//             ],
//           ),
//           SizedBox(height: 24.h),
//         ],
//       ),
//     );
//   }
// }
