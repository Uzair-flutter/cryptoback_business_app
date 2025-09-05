// ui/notifier/business_step_notifier.dart
import 'package:cryptoback_business_app/utils/base_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/business_step_state.dart';

// class BusinessStepNotifiers extends BaseNotifier<BusinessStepState> {
//   BusinessStepNotifiers() : super(BusinessStepState());
//
//   @override
//   void handleError(String message) {
//     print('Error: $message');
//   }
//
//   final addressController = TextEditingController();
//   void updateSelectedDay(String? day) {
//     state = state.copyWith(selectedDay: day);
//   }
//
//   // New method to update selected address
//   void updateSelectedAddress(String? address) {
//     state = state.copyWith(selectedAddress: address);
//   }
//
//   void updateStartTime(TimeOfDay time) {
//     state = state.copyWith(startTime: time);
//   }
//
//   void updateEndTime(TimeOfDay time) {
//     state = state.copyWith(endTime: time);
//   }
//
//   void addBusinessLocation() {
//     // Add location if address is selected
//     if (state.selectedAddress != null && state.selectedAddress!.isNotEmpty) {
//       List<String> newLocations = List.from(state.businessLocation ?? []);
//       newLocations.add(state.selectedAddress!);
//
//       state = state.copyWith(
//         businessLocation: newLocations,
//         selectedAddress: null, // Clear selected address after adding
//       );
//     }
//
//     // Keep existing business hour logic
//   }
//
//   void addBusinessHour() {
//     if (state.selectedDay != null &&
//         state.startTime != null &&
//         state.endTime != null) {
//       List<BusinessHour> newHours = List.from(state.businessHours);
//
//       newHours.add(
//         BusinessHour(
//           day: state.selectedDay!,
//           startTime: state.startTime!,
//           endTime: state.endTime!,
//         ),
//       );
//
//       state = state.copyWith(
//         businessHours: newHours,
//         selectedDay: null,
//         startTime: null,
//         endTime: null,
//       );
//     }
//   }
//
//   void removeBusinessHour(int index) {
//     List<BusinessHour> newHours = List.from(state.businessHours);
//     newHours.removeAt(index);
//     state = state.copyWith(businessHours: newHours);
//   }
//
//   // New method to remove business location
//   void removeBusinessLocation(int index) {
//     List<String> newLocations = List.from(state.businessLocation ?? []);
//     newLocations.removeAt(index);
//     state = state.copyWith(businessLocation: newLocations);
//   }
// }
//
// final businessStepProvider =
//     StateNotifierProvider<BusinessStepNotifiers, BusinessStepState>(
//       (ref) => BusinessStepNotifiers(),
//     );

class BusinessStepNotifiers extends BaseNotifier<BusinessStepState> {
  BusinessStepNotifiers() : super(BusinessStepState());

  @override
  void handleError(String message) {
    print('Error: $message');
  }

  final addressController = TextEditingController();
  final businessDescriptionController = TextEditingController();

  // Navigation methods
  void nextStep() {
    if (state.currentStep! < 4) {
      state = state.copyWith(currentStep: state.currentStep! + 1);
    }
  }

  void previousStep() {
    if (state.currentStep! > 0) {
      state = state.copyWith(currentStep: state.currentStep! - 1);
    }
  }

  void setCurrentStep(int step) {
    if (step >= 0 && step <= 4) {
      state = state.copyWith(currentStep: step);
    }
  }

  void updateSelectedDay(String? day) {
    state = state.copyWith(selectedDay: day);
  }

  void updateSelectedAddress(String? address) {
    state = state.copyWith(selectedAddress: address);
  }

  void updateStartTime(TimeOfDay time) {
    state = state.copyWith(startTime: time);
  }

  void updateEndTime(TimeOfDay time) {
    state = state.copyWith(endTime: time);
  }

  void addBusinessLocation() {
    if (state.selectedAddress != null && state.selectedAddress!.isNotEmpty) {
      List<String> newLocations = List.from(state.businessLocation);
      newLocations.add(state.selectedAddress!);

      state = state.copyWith(
        businessLocation: newLocations,
        selectedAddress: null,
      );

      // Validate business location after adding
      validateBusinessLocation();
    }
  }

  void addBusinessHour() {
    if (state.selectedDay != null &&
        state.startTime != null &&
        state.endTime != null) {
      List<BusinessHour> newHours = List.from(state.businessHours);

      newHours.add(
        BusinessHour(
          day: state.selectedDay!,
          startTime: state.startTime!,
          endTime: state.endTime!,
        ),
      );

      state = state.copyWith(
        businessHours: newHours,
        selectedDay: null,
        startTime: null,
        endTime: null,
      );

      // Validate business hours after adding
      validateBusinessHours();
    }
  }

  void removeBusinessHour(int index) {
    List<BusinessHour> newHours = List.from(state.businessHours);
    newHours.removeAt(index);
    state = state.copyWith(businessHours: newHours);

    // Re-validate business hours after removal
    validateBusinessHours();
  }

  void removeBusinessLocation(int index) {
    List<String> newLocations = List.from(state.businessLocation);
    newLocations.removeAt(index);
    state = state.copyWith(businessLocation: newLocations);

    // Re-validate business location after removal
    validateBusinessLocation();
  }

  // Validation methods
  void updateBusinessDescription(String description) {
    state = state.copyWith(
      businessDescription: description,
      isBusinessDescriptionValid:
          description.trim().isNotEmpty && description.trim().length >= 10,
    );
  }

  void updateCategorySelection(bool isSelected) {
    state = state.copyWith(isCategorySelected: isSelected);
  }

  void validateBusinessHours() {
    bool isValid = state.businessHours.isNotEmpty;
    state = state.copyWith(isBusinessHoursValid: isValid);
  }

  void validateBusinessLocation() {
    bool isValid = state.businessLocation.isNotEmpty;
    state = state.copyWith(isBusinessLocationValid: isValid);
  }

  // Validate current step
  bool validateCurrentStep() {
    switch (state.currentStep) {
      case 0: // CategorySelectionView
        return state.isCategorySelected;
      case 1: // DescribeBusiness
        return state.isBusinessDescriptionValid;
      case 2: // UploadLogoView - skip validation as requested
        return true;
      case 3: // BusinessDaysView
        return state.isBusinessHoursValid;
      case 4: // AddStoreLocationsView
        return state.isBusinessLocationValid;
      default:
        return false;
    }
  }

  // Get validation error message for current step
  String? getValidationErrorMessage() {
    switch (state.currentStep) {
      case 0:
        return state.isCategorySelected
            ? null
            : 'Please select a business category';
      case 1:
        return state.isBusinessDescriptionValid
            ? null
            : 'Please enter a business description (minimum 10 characters)';
      case 2:
        return null; // Skip validation for UploadLogoView
      case 3:
        return state.isBusinessHoursValid
            ? null
            : 'Please add at least one business hour';
      case 4:
        return state.isBusinessLocationValid
            ? null
            : 'Please add at least one store location';
      default:
        return 'Invalid step';
    }
  }
}

final businessStepProvider =
    StateNotifierProvider<BusinessStepNotifiers, BusinessStepState>(
      (ref) => BusinessStepNotifiers(),
    );
