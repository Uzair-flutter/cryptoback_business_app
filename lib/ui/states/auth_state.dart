class AuthState {
  final String? businessNiche;
  final bool isLoading;
  final bool isPasswordVisible;
  final bool rememberMe;
  final bool termsAndCondition;
  final bool isAuthenticated;
  final String? errorMessage;
  final String? otpCode;
  final bool isOtpValid;

  AuthState({
    this.businessNiche,
    this.errorMessage,
    required this.isLoading,
    required this.isPasswordVisible,
    required this.rememberMe,
    required this.termsAndCondition,
    this.isAuthenticated = false,
    this.otpCode,
    this.isOtpValid = false,
  });

  AuthState copyWith({
    String? businessNiche,
    bool? isLoading,
    bool? isPasswordVisible,
    bool? rememberMe,
    bool? isAuthenticated,
    bool? termsAndCondition,

    String? errorMessage,
    String? otpCode,
    bool? isOtpValid,
  }) {
    return AuthState(
      businessNiche: businessNiche ?? this.businessNiche,
      isLoading: isLoading ?? this.isLoading,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      rememberMe: rememberMe ?? this.rememberMe,
      isAuthenticated: isAuthenticated ?? false,
      errorMessage: errorMessage,
      otpCode: otpCode ?? this.otpCode,
      isOtpValid: isOtpValid ?? this.isOtpValid,
      termsAndCondition: termsAndCondition ?? this.termsAndCondition,
    );
  }
}
