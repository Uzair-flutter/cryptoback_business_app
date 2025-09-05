import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../resources/assets.dart';
import '../../utils/base_notifier.dart';
import '../states/merchant_states.dart';

final merchantProvider = StateNotifierProvider((_) => MerchantNotifier());

class MerchantNotifier extends BaseNotifier<MerchantState> {
  MerchantNotifier()
    : super(
        MerchantState(
          isLoading: false,
          currentCarouselIndex: 0,
          merchantImages: [
            DummyAssets.dunkin,
            DummyAssets.dunkin,
            DummyAssets.dunkin,
            DummyAssets.dunkin,
          ],
          selectedCategory: 'All',
          selectedTab: 'Offers',
          isHoursExpanded: false,
        ),
      );

  void updateCarouselIndex(int index) {
    state = state.copyWith(currentCarouselIndex: index);
  }

  void setMerchantImages(List<String> images) {
    state = state.copyWith(merchantImages: images);
  }

  void updateSelectedCategory(String category) {
    state = state.copyWith(selectedCategory: category);
  }

  void updateSelectedTab(String tab) {
    state = state.copyWith(selectedTab: tab);
  }

  void toggleHoursExpansion() {
    state = state.copyWith(isHoursExpanded: !state.isHoursExpanded);
  }

  @override
  void handleError(String message) {
    state = state.copyWith(errorMessage: message);
  }
}
