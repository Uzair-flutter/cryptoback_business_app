class CampaignState {
  final String? campaignTitle;
  final String? discountType;
  final String? percentage;
  final String? amount;
  final String? cappedAmount;
  final DateTime? startTime; // Changed from TimeOfDay to DateTime
  final DateTime? endTime; // Changed from TimeOfDay to DateTime
  final String? usageLimit;

  // Validation errors
  final Map<String, String?> errors;

  CampaignState({
    this.campaignTitle,
    this.discountType,
    this.percentage,
    this.amount,
    this.cappedAmount,
    this.startTime,
    this.endTime,
    this.usageLimit,
    this.errors = const {},
  });

  CampaignState copyWith({
    String? campaignTitle,
    String? discountType,
    String? percentage,
    String? amount,
    String? cappedAmount,
    DateTime? startTime, // Changed from TimeOfDay to DateTime
    DateTime? endTime, // Changed from TimeOfDay to DateTime
    String? usageLimit,
    Map<String, String?>? errors,
  }) {
    return CampaignState(
      campaignTitle: campaignTitle ?? this.campaignTitle,
      discountType: discountType ?? this.discountType,
      percentage: percentage ?? this.percentage,
      amount: amount ?? this.amount,
      cappedAmount: cappedAmount ?? this.cappedAmount,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      usageLimit: usageLimit ?? this.usageLimit,
      errors: errors ?? this.errors,
    );
  }
}

// class CampaignState {
//   final String? campaignTitle;
//   final String? discountType;
//   final String? percentage;
//   final String? amount;
//   final String? cappedAmount;
//   final TimeOfDay? startTime;
//   final TimeOfDay? endTime;
//   final String? usageLimit;
//
//   // Validation errors
//   final Map<String, String?> errors;
//
//   CampaignState({
//     this.campaignTitle,
//     this.discountType,
//     this.percentage,
//     this.amount,
//     this.cappedAmount,
//     this.startTime,
//     this.endTime,
//     this.usageLimit,
//     this.errors = const {},
//   });
//
//   CampaignState copyWith({
//     String? campaignTitle,
//     String? discountType,
//     String? percentage,
//     String? amount,
//     String? cappedAmount,
//     TimeOfDay? startTime,
//     TimeOfDay? endTime,
//     String? usageLimit,
//     Map<String, String?>? errors,
//   }) {
//     return CampaignState(
//       campaignTitle: campaignTitle ?? this.campaignTitle,
//       discountType: discountType ?? this.discountType,
//       percentage: percentage ?? this.percentage,
//       amount: amount ?? this.amount,
//       cappedAmount: cappedAmount ?? this.cappedAmount,
//       startTime: startTime ?? this.startTime,
//       endTime: endTime ?? this.endTime,
//       usageLimit: usageLimit ?? this.usageLimit,
//       errors: errors ?? this.errors,
//     );
//   }
// }
