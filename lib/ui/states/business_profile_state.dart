class BusinessProfileState {
  final bool isMyLinksSelected;
  final bool isGenerateLink;

  const BusinessProfileState({
    this.isMyLinksSelected = true,
    this.isGenerateLink = false,
  });

  BusinessProfileState copyWith({
    bool? isMyLinksSelected,
    bool? isGenerateLink,
  }) {
    return BusinessProfileState(
      isMyLinksSelected: isMyLinksSelected ?? this.isMyLinksSelected,
      isGenerateLink: isGenerateLink ?? this.isGenerateLink,
    );
  }
}
