import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states/business_notification_state.dart';

class BusinessNotificationNotifier
    extends StateNotifier<BusinessNotificationState> {
  BusinessNotificationNotifier() : super(const BusinessNotificationState());

  void togglePushNotifications(bool value) {
    state = state.copyWith(pushNotifications: value);
  }

  void toggleVibrations(bool value) {
    state = state.copyWith(vibrations: value);
  }

  void toggleSounds(bool value) {
    state = state.copyWith(sounds: value);
  }

  void enableAllNotifications() {
    state = const BusinessNotificationState(
      pushNotifications: true,
      vibrations: true,
      sounds: true,
    );
  }

  void disableAllNotifications() {
    state = const BusinessNotificationState(
      pushNotifications: false,
      vibrations: false,
      sounds: false,
    );
  }

  void resetToDefault() {
    state = const BusinessNotificationState();
  }
}

// Provider
final businessNotificationProvider =
    StateNotifierProvider<
      BusinessNotificationNotifier,
      BusinessNotificationState
    >((ref) => BusinessNotificationNotifier());
