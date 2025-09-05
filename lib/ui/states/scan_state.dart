class ScanState {
  final bool hasPermission;
  final bool isInitialized;
  final bool isScanning;
  final bool isFlashOn;
  final String? errorMessage;
  final bool isLoading;

  ScanState({
    this.hasPermission = false,
    this.isInitialized = false,
    this.isScanning = true,
    this.isFlashOn = false,
    this.errorMessage,
    this.isLoading = false,
  });

  ScanState copyWith({
    bool? hasPermission,
    bool? isInitialized,
    bool? isScanning,
    bool? isFlashOn,
    String? errorMessage,
    bool? isLoading,
  }) {
    return ScanState(
      hasPermission: hasPermission ?? this.hasPermission,
      isInitialized: isInitialized ?? this.isInitialized,
      isScanning: isScanning ?? this.isScanning,
      isFlashOn: isFlashOn ?? this.isFlashOn,
      errorMessage: errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
