import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import '../states/business_profile_state.dart';

class BusinessProfileNotifier extends StateNotifier<BusinessProfileState> {
  BusinessProfileNotifier() : super(const BusinessProfileState());

  void selectMyLinks() {
    state = state.copyWith(isMyLinksSelected: true);
  }

  void selectReferrals() {
    state = state.copyWith(isMyLinksSelected: false);
  }

  void toggleGenerateLink() {
    state = state.copyWith(isGenerateLink: !state.isGenerateLink);
  }

  void setGenerateLink(bool value) {
    state = state.copyWith(isGenerateLink: value);
  }

  void resetState() {
    state = const BusinessProfileState();
  }
}

// Provider
final businessProfileProvider =
    StateNotifierProvider<BusinessProfileNotifier, BusinessProfileState>(
      (ref) => BusinessProfileNotifier(),
    );
