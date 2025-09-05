// ignore_for_file: unused_field, prefer_final_fields

import 'package:cryptoback_business_app/services/storage_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/locator.dart';
import '../../utils/base_notifier.dart';
import '../states/auth_state.dart';

final authProvider = StateNotifierProvider((_) => AuthNotifier());

class AuthNotifier extends BaseNotifier<AuthState> {
  AuthNotifier()
    : super(
        AuthState(
          isLoading: false,
          rememberMe: false,
          isPasswordVisible: false,
          termsAndCondition: false,
        ),
      ) {
    checkAuthentication();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  void toggleRememberMe() {
    state = state.copyWith(rememberMe: !state.rememberMe);
  }

  void updateSelectedNiche(String? niche) {
    state = state.copyWith(businessNiche: niche);
  }

  void toggleTermsAndCondition() {
    state = state.copyWith(termsAndCondition: !state.termsAndCondition);
  }

  void handleOtpCompletion(String otp) {
    state = state.copyWith(otpCode: otp, isOtpValid: otp.length == 5);
  }

  void handleOtpChange(String pin) {
    state = state.copyWith(otpCode: pin, isOtpValid: pin.length == 5);
  }

  Future<void> checkAuthentication() async {
    await runSafely(() async {
      final accessToken = locator<StorageService>().getAccessToken();
      await Future.delayed(Duration(seconds: 3));
      if (accessToken != null) {
        state = state.copyWith(isAuthenticated: true);
      }
    });
  }

  Future<void> login() async {
    state = state.copyWith(isLoading: true);
    state = state.copyWith(isAuthenticated: true);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    otpController.dispose();
    super.dispose();
  }

  @override
  void handleError(String message) {
    state = state.copyWith(errorMessage: message);
  }
}
