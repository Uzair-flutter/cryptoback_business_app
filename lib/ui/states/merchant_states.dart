class MerchantState {
  final bool isLoading;
  final int currentCarouselIndex;
  final List<String> merchantImages;
  final String? errorMessage;
  final String selectedCategory;
  final String selectedTab;
  final bool isHoursExpanded;

  MerchantState({
    required this.isLoading,
    required this.currentCarouselIndex,
    required this.merchantImages,
    this.errorMessage,
    required this.selectedCategory,
    required this.selectedTab,
    required this.isHoursExpanded,
  });

  MerchantState copyWith({
    bool? isLoading,
    int? currentCarouselIndex,
    List<String>? merchantImages,
    String? errorMessage,
    String? selectedCategory,
    String? selectedTab,
    bool? isHoursExpanded,
  }) {
    return MerchantState(
      isLoading: isLoading ?? this.isLoading,
      currentCarouselIndex: currentCarouselIndex ?? this.currentCarouselIndex,
      merchantImages: merchantImages ?? this.merchantImages,
      errorMessage: errorMessage,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedTab: selectedTab ?? this.selectedTab,
      isHoursExpanded: isHoursExpanded ?? this.isHoursExpanded,
    );
  }
}
