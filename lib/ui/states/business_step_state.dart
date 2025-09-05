// ui/states/business_step_state.dart
import 'package:flutter/material.dart';

// class BusinessStepState {
//   final String? selectedDay;
//   final String? selectedAddress; // New field for selected address
//   final TimeOfDay? startTime;
//   final TimeOfDay? endTime;
//   final List<String> businessLocation;
//   final List<BusinessHour> businessHours;
//
//   BusinessStepState({
//     this.selectedDay,
//     this.selectedAddress, // Add this parameter
//     this.startTime,
//     this.endTime,
//     this.businessHours = const [],
//     this.businessLocation = const [],
//   });
//
//   BusinessStepState copyWith({
//     String? selectedDay,
//     String? selectedAddress, // Add this parameter
//     TimeOfDay? startTime,
//     TimeOfDay? endTime,
//     List<BusinessHour>? businessHours,
//     List<String>? businessLocation,
//   }) {
//     return BusinessStepState(
//       selectedDay: selectedDay ?? this.selectedDay,
//       selectedAddress:
//           selectedAddress, // Update this line to allow null clearing
//       startTime: startTime ?? this.startTime,
//       endTime: endTime ?? this.endTime,
//       businessHours: businessHours ?? this.businessHours,
//       businessLocation: businessLocation ?? this.businessLocation,
//     );
//   }
// }

// Business hour model

class BusinessStepState {
  final int? currentStep;
  final String? selectedDay;
  final String? selectedAddress;
  final TimeOfDay? startTime;
  final TimeOfDay? endTime;
  final List<String> businessLocation;
  final List<BusinessHour> businessHours;

  // Validation fields for each step
  final String? businessDescription;
  final bool isCategorySelected;
  final bool isBusinessDescriptionValid;
  final bool isBusinessHoursValid;
  final bool isBusinessLocationValid;

  BusinessStepState({
    this.currentStep = 0,
    this.selectedDay,
    this.selectedAddress,
    this.startTime,
    this.endTime,
    this.businessHours = const [],
    this.businessLocation = const [],
    this.businessDescription,
    this.isCategorySelected = false,
    this.isBusinessDescriptionValid = false,
    this.isBusinessHoursValid = false,
    this.isBusinessLocationValid = false,
  });

  BusinessStepState copyWith({
    int? currentStep,
    String? selectedDay,
    String? selectedAddress,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    List<BusinessHour>? businessHours,
    List<String>? businessLocation,
    String? businessDescription,
    bool? isCategorySelected,
    bool? isBusinessDescriptionValid,
    bool? isBusinessHoursValid,
    bool? isBusinessLocationValid,
  }) {
    return BusinessStepState(
      currentStep: currentStep ?? this.currentStep,
      selectedDay: selectedDay ?? this.selectedDay,
      selectedAddress: selectedAddress,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      businessHours: businessHours ?? this.businessHours,
      businessLocation: businessLocation ?? this.businessLocation,
      businessDescription: businessDescription ?? this.businessDescription,
      isCategorySelected: isCategorySelected ?? this.isCategorySelected,
      isBusinessDescriptionValid:
          isBusinessDescriptionValid ?? this.isBusinessDescriptionValid,
      isBusinessHoursValid: isBusinessHoursValid ?? this.isBusinessHoursValid,
      isBusinessLocationValid:
          isBusinessLocationValid ?? this.isBusinessLocationValid,
    );
  }
}

class BusinessHour {
  final String day;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  BusinessHour({
    required this.day,
    required this.startTime,
    required this.endTime,
  });
}
