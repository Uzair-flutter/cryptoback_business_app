import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/business_campaign_state.dart';

class BusinessCampaignNotifier extends StateNotifier<CampaignState> {
  BusinessCampaignNotifier() : super(const CampaignState());

  void updateCampaignTitle(String title) {
    state = state.copyWith(campaignTitle: title);
  }

  void updateCappedAmount(String amount) {
    state = state.copyWith(cappedAmount: amount);
  }

  void updatePercentage(String percentage) {
    state = state.copyWith(percentage: percentage);
  }

  void updateDiscountType(String? type) {
    state = state.copyWith(selectedDiscountType: type);
  }

  void updateUsageLimit(String? limit) {
    state = state.copyWith(selectedUsageLimit: limit);
  }

  void updateStartDate(DateTime? date) {
    state = state.copyWith(startDate: date);
  }

  void updateEndDate(DateTime? date) {
    state = state.copyWith(endDate: date);
  }

  void resetForm() {
    state = const CampaignState();
  }

  // Helper method to get campaign data
  Map<String, dynamic> getCampaignData() {
    return {
      'campaignTitle': state.campaignTitle,
      'cappedAmount': state.cappedAmount,
      'percentage': state.percentage,
      'discountType': state.selectedDiscountType,
      'usageLimit': state.selectedUsageLimit,
      'startDate': state.startDate?.toIso8601String(),
      'endDate': state.endDate?.toIso8601String(),
    };
  }
}

// Provider
final campaignProvider =
    StateNotifierProvider<BusinessCampaignNotifier, CampaignState>(
      (ref) => BusinessCampaignNotifier(),
    );
