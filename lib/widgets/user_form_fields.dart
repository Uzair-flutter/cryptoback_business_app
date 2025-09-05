import 'dart:developer';

import 'package:cryptoback_business_app/ui/notifier/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class EmailFieldWidget extends ConsumerWidget {
  const EmailFieldWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewModel = ref.read(authProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: authViewModel.emailController,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Email cannot be empty';
            } else if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
            ).hasMatch(value)) {
              return 'Enter a valid email address';
            }
            return null;
          },

          onChanged: (text) {},
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Email Address',
            // prefixIcon: Padding(
            //   padding: const EdgeInsets.all(16),
            //   child: SvgPicture.asset(emailIcon),
            // ),
          ),
        ),
        SizedBox(height: 5.h),
        // Visibility(
        //   visible: authViewModel.emailFieldError.isNotEmpty,
        //   child: blue12w600Center(data: authViewModel.getEmailFieldError),
        // ),
      ],
    );
  }
}

class PasswordFieldWidget extends ConsumerWidget {
  final String hintText;
  final TextEditingController passwordController;
  const PasswordFieldWidget({
    super.key,
    this.hintText = 'Password',
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);
    final state = ref.watch(authProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          obscureText: !state.isPasswordVisible,
          controller: passwordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Password is required';
            }
            if (value.length < 8) {
              return 'Password must be at least 8 characters long';
            }
            if (!RegExp(r'[A-Z]').hasMatch(value)) {
              return 'Include at least one uppercase letter';
            }
            if (!RegExp(r'[a-z]').hasMatch(value)) {
              return 'Include at least one lowercase letter';
            }
            if (!RegExp(r'[0-9]').hasMatch(value)) {
              return 'Include at least one number';
            }
            if (!RegExp(r'[!@#$&*~€¥\\]').hasMatch(value)) {
              return 'Include at least one special character (@#\$&*~€¥\\)';
            }
            return null;
          },

          onChanged: (text) {},
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(
                  authProvider.select((state) => state.isPasswordVisible),
                );
                log('PASSWORD VISIBILITY: ${state}');
                return GestureDetector(
                  onTap: authNotifier.togglePasswordVisibility,
                  child: Icon(
                    state ? Iconsax.eye : Iconsax.eye_slash,
                    size: 14.sp,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
