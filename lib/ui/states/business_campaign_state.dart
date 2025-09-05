class CampaignState {
  final String campaignTitle;
  final String cappedAmount;
  final String percentage;
  final String? selectedDiscountType;
  final String? selectedUsageLimit;
  final DateTime? startDate;
  final DateTime? endDate;
  const CampaignState({
    this.campaignTitle = '',
    this.cappedAmount = '',
    this.percentage = '',
    this.selectedDiscountType,
    this.selectedUsageLimit,
    this.startDate,
    this.endDate,
  });

  CampaignState copyWith({
    String? campaignTitle,
    String? cappedAmount,
    String? percentage,
    String? selectedDiscountType,
    String? selectedUsageLimit,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return CampaignState(
      campaignTitle: campaignTitle ?? this.campaignTitle,
      cappedAmount: cappedAmount ?? this.cappedAmount,
      percentage: percentage ?? this.percentage,
      selectedDiscountType: selectedDiscountType ?? this.selectedDiscountType,
      selectedUsageLimit: selectedUsageLimit ?? this.selectedUsageLimit,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  // Helper method to check if form is valid
  bool get isValid {
    return campaignTitle.isNotEmpty &&
        selectedDiscountType != null &&
        selectedUsageLimit != null &&
        startDate != null &&
        endDate != null &&
        cappedAmount.isNotEmpty;
  }
}
