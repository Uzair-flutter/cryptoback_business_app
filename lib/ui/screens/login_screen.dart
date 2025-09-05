import 'package:cryptoback_business_app/app_routes.dart';
import 'package:cryptoback_business_app/resources/assets.dart';
import 'package:cryptoback_business_app/ui/notifier/auth_notifier.dart';
import 'package:cryptoback_business_app/ui/notifier/constant_notifiers.dart';
import 'package:cryptoback_business_app/utils/custom_font_style.dart';
import 'package:cryptoback_business_app/utils/responsive.dart';
import 'package:cryptoback_business_app/widgets/user_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends ConsumerWidget {
  static const String routeName = '/login_screen';
  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);
    final role = ref.read(roleNotifier);
    ref.listen(authProvider, (prev, next) {
      if (next.isAuthenticated) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          businessBottomNavBBarRoute,
          (route) => false,
        );
        // role == Roles.shopper
        //     ? Navigator.pushNamedAndRemoveUntil(
        //         context,
        //         shopprBottomNavBarRoute,
        //         (route) => false,
        //       )
        //     : Navigator.pushNamedAndRemoveUntil(
        //         context,
        //         businessBottomNavBBarRoute,
        //         (route) => false,
        //       );
      }
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 80.h),
                Center(
                  child: SvgPicture.asset(
                    SvgAssets.logo2,
                    width: 186.w,
                    height: 63.h,
                  ),
                ),
                SizedBox(height: 57.h),
                Center(child: black232w600Center(data: 'Login')),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    grey12w500Center(data: 'Don’t have an account?'),
                    SizedBox(width: 4.w),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, signupRoute);
                      },
                      // onTap: () => role == Roles.shopper
                      //     ? Navigator.pushNamed(context, signupThroughRoute)
                      //     : Navigator.pushNamed(context, signupRoute),
                      child: blue12w600Center(data: 'Sign Up'),
                    ),
                  ],
                ),

                SizedBox(height: 24.h),
                EmailFieldWidget(),
                SizedBox(height: 16.h),
                PasswordFieldWidget(
                  passwordController: authNotifier.passwordController,
                ),
                SizedBox(height: 7.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Transform.scale(
                          scale: Responsive.getResponsiveDesign(
                            mobile: () => 0.7,
                            smallTablet: () => 0.8,
                            tablet: () => 0.9,
                          ),
                          child: Consumer(
                            builder: (context, ref, child) {
                              final state = ref.watch(
                                authProvider.select(
                                  (state) => state.rememberMe,
                                ),
                              );
                              return Checkbox(
                                value: state,
                                onChanged: (_) =>
                                    authNotifier.toggleRememberMe(),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    5.r,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        grey12w500Center(data: "Remember me"),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, forgotPassRoute);
                      },
                      child: blue12w600Center(data: 'Forgot Password ?'),
                    ),
                  ],
                ),

                SizedBox(height: 24.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // if (!formKey.currentState!.validate()) {
                      //   return;
                      // }
                      ref.read(authProvider.notifier).login();
                    },
                    child: Text('Log In'),
                  ),
                ),
                SizedBox(height: 24.h),
                // if (role == Roles.shopper)
                //   Column(
                //     children: [
                //       SvgPicture.asset(
                //         SvgAssets.or,
                //         height: 25.h,
                //         width: 343.w,
                //       ),
                //       SizedBox(height: 24.h),
                //
                //       SocialButton(
                //         text: 'Continue with Google',
                //         iconPath: SvgAssets.google,
                //         onPressed: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => ShopperBottomNavBar(),
                //             ),
                //           );
                //         },
                //       ),
                //       SizedBox(height: 16.h),
                //       SocialButton(
                //         text: 'Continue with Facebook',
                //         iconPath: SvgAssets.facebook,
                //         onPressed: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => ShopperBottomNavBar(),
                //             ),
                //           );
                //         },
                //       ),
                //     ],
                //   ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
