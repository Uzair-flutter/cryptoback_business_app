import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/new_campaign_state.dart';

final campaignProvider =
    StateNotifierProvider.autoDispose<CampaignNotifier, CampaignState>(
      (ref) => CampaignNotifier(),
    );

class CampaignNotifier extends StateNotifier<CampaignState> {
  CampaignNotifier() : super(CampaignState());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final percentageController = TextEditingController();
  final amountController = TextEditingController();
  final cappedAmountController = TextEditingController();

  void setCampaignTitle(String value) => state = state.copyWith(
    campaignTitle: value,
    errors: {...state.errors, "title": null},
  );

  void setDiscountType(String? value) => state = state.copyWith(
    discountType: value,
    errors: {...state.errors, "discountType": null},
  );

  void setPercentage(String value) => state = state.copyWith(
    percentage: value,
    errors: {...state.errors, "percentage": null},
  );

  void setAmount(String value) => state = state.copyWith(
    amount: value,
    errors: {...state.errors, "amount": null},
  );

  void setCappedAmount(String value) => state = state.copyWith(
    cappedAmount: value,
    errors: {...state.errors, "cappedAmount": null},
  );

  void setStartTime(DateTime value) => state = state.copyWith(
    // Changed from TimeOfDay to DateTime
    startTime: value,
    errors: {...state.errors, "startTime": null},
  );

  void setEndTime(DateTime value) => state = state.copyWith(
    // Changed from TimeOfDay to DateTime
    endTime: value,
    errors: {...state.errors, "endTime": null},
  );

  void setUsageLimit(String? value) => state = state.copyWith(
    usageLimit: value,
    errors: {...state.errors, "usageLimit": null},
  );

  /// 🔹 Validate all fields
  bool validateAll() {
    final errors = <String, String?>{};

    if (state.campaignTitle == null || state.campaignTitle!.isEmpty) {
      errors["title"] = "Campaign title is required";
    }

    if (state.discountType == null || state.discountType!.isEmpty) {
      errors["discountType"] = "Please select a discount type";
    } else if (state.discountType == "Percentage") {
      if (state.percentage == null || state.percentage!.isEmpty) {
        errors["percentage"] = "Percentage is required";
      } else {
        final num? val = num.tryParse(state.percentage!);
        if (val == null || val <= 0 || val > 100) {
          errors["percentage"] = "Enter valid percentage (1–100)";
        }
      }
    } else if (state.discountType == "Amount") {
      if (state.amount == null || state.amount!.isEmpty) {
        errors["amount"] = "Amount is required";
      } else {
        final num? val = num.tryParse(state.amount!);
        if (val == null || val <= 0) {
          errors["amount"] = "Enter valid amount";
        }
      }
    }

    if (state.startTime == null) {
      errors["startTime"] = "Start date is required"; // Updated error message
    }
    if (state.endTime == null) {
      errors["endTime"] = "End date is required"; // Updated error message
    }

    if (state.usageLimit == null || state.usageLimit!.isEmpty) {
      errors["usageLimit"] = "Please select a usage limit";
    }

    if (state.cappedAmount == null || state.cappedAmount!.isEmpty) {
      errors["cappedAmount"] = "Amount is required";
    } else {
      final num? val = num.tryParse(state.cappedAmount!);
      if (val == null || val <= 0) {
        errors["cappedAmount"] = "Enter valid amount";
      }
    }

    state = state.copyWith(errors: errors);
    return errors.isEmpty;
  }

  @override
  void dispose() {
    titleController.dispose();
    percentageController.dispose();
    cappedAmountController.dispose();
    amountController.dispose();
    super.dispose();
  }
}

// final campaignProvider =
//     StateNotifierProvider.autoDispose<CampaignNotifier, CampaignState>(
//       (ref) => CampaignNotifier(),
//     );
//
// class CampaignNotifier extends StateNotifier<CampaignState> {
//   CampaignNotifier() : super(CampaignState());
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final titleController = TextEditingController();
//   final percentageController = TextEditingController();
//   final amountController = TextEditingController();
//   final cappedAmountController = TextEditingController();
//
//   void setCampaignTitle(String value) => state = state.copyWith(
//     campaignTitle: value,
//     errors: {...state.errors, "title": null},
//   );
//
//   void setDiscountType(String? value) => state = state.copyWith(
//     discountType: value,
//     errors: {...state.errors, "discountType": null},
//   );
//
//   void setPercentage(String value) => state = state.copyWith(
//     percentage: value,
//     errors: {...state.errors, "percentage": null},
//   );
//
//   void setAmount(String value) => state = state.copyWith(
//     amount: value,
//     errors: {...state.errors, "amount": null},
//   );
//
//   void setCappedAmount(String value) => state = state.copyWith(
//     cappedAmount: value,
//     errors: {...state.errors, "cappedAmount": null},
//   );
//
//   void setStartTime(TimeOfDay value) => state = state.copyWith(
//     startTime: value,
//     errors: {...state.errors, "startTime": null},
//   );
//
//   void setEndTime(TimeOfDay value) => state = state.copyWith(
//     endTime: value,
//     errors: {...state.errors, "endTime": null},
//   );
//
//   void setUsageLimit(String? value) => state = state.copyWith(
//     usageLimit: value,
//     errors: {...state.errors, "usageLimit": null},
//   );
//
//   /// 🔹 Validate all fields
//   bool validateAll() {
//     final errors = <String, String?>{};
//
//     if (state.campaignTitle == null || state.campaignTitle!.isEmpty) {
//       errors["title"] = "Campaign title is required";
//     }
//
//     if (state.discountType == null || state.discountType!.isEmpty) {
//       errors["discountType"] = "Please select a discount type";
//     } else if (state.discountType == "Percentage") {
//       if (state.percentage == null || state.percentage!.isEmpty) {
//         errors["percentage"] = "Percentage is required";
//       } else {
//         final num? val = num.tryParse(state.percentage!);
//         if (val == null || val <= 0 || val > 100) {
//           errors["percentage"] = "Enter valid percentage (1–100)";
//         }
//       }
//     } else if (state.discountType == "Amount") {
//       if (state.amount == null || state.amount!.isEmpty) {
//         errors["amount"] = "Amount is required";
//       } else {
//         final num? val = num.tryParse(state.amount!);
//         if (val == null || val <= 0) {
//           errors["amount"] = "Enter valid amount";
//         }
//       }
//     }
//
//     if (state.startTime == null) {
//       errors["startTime"] = "Start time is required";
//     }
//     if (state.endTime == null) {
//       errors["endTime"] = "End time is required";
//     }
//
//     if (state.usageLimit == null || state.usageLimit!.isEmpty) {
//       errors["usageLimit"] = "Please select a usage limit";
//     }
//
//     if (state.cappedAmount == null || state.cappedAmount!.isEmpty) {
//       errors["cappedAmount"] = "Amount is required";
//     } else {
//       final num? val = num.tryParse(state.cappedAmount!);
//       if (val == null || val <= 0) {
//         errors["cappedAmount"] = "Enter valid amount";
//       }
//     }
//
//     state = state.copyWith(errors: errors);
//     return errors.isEmpty;
//   }
//
//   @override
//   void dispose() {
//     titleController.dispose();
//     percentageController.dispose();
//     cappedAmountController.dispose();
//     amountController.dispose();
//     super.dispose();
//   }
// }
