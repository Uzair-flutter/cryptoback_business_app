class BusinessNotificationState {
  final bool pushNotifications;
  final bool vibrations;
  final bool sounds;

  const BusinessNotificationState({
    this.pushNotifications = true,
    this.vibrations = true,
    this.sounds = true,
  });

  BusinessNotificationState copyWith({
    bool? pushNotifications,
    bool? vibrations,
    bool? sounds,
  }) {
    return BusinessNotificationState(
      pushNotifications: pushNotifications ?? this.pushNotifications,
      vibrations: vibrations ?? this.vibrations,
      sounds: sounds ?? this.sounds,
    );
  }
}
