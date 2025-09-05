// ui/states/business_setup_state.dart
import 'package:flutter/material.dart';

class BusinessSetupState {
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

  BusinessSetupState({
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

  BusinessSetupState copyWith({
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
    return BusinessSetupState(
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
