import 'package:cryptoback_business_app/ui/screens/about_us_screen.dart';
import 'package:cryptoback_business_app/ui/screens/business_bottom_nav.dart';
import 'package:cryptoback_business_app/ui/screens/business_notification_view.dart';
import 'package:cryptoback_business_app/ui/screens/business_referral_program_view.dart';
import 'package:cryptoback_business_app/ui/screens/business_setup_view.dart';
import 'package:cryptoback_business_app/ui/screens/camera_screen.dart';
import 'package:cryptoback_business_app/ui/screens/e_wallet.dart';
import 'package:cryptoback_business_app/ui/screens/e_wallet_list.dart';
import 'package:cryptoback_business_app/ui/screens/favorites_screen.dart';
import 'package:cryptoback_business_app/ui/screens/forgot_password_Screen.dart';
import 'package:cryptoback_business_app/ui/screens/help_center.dart';
import 'package:cryptoback_business_app/ui/screens/login_screen.dart';
import 'package:cryptoback_business_app/ui/screens/merchant_detail_screen.dart';
import 'package:cryptoback_business_app/ui/screens/notification_screen.dart';
import 'package:cryptoback_business_app/ui/screens/otp_Screen.dart';
import 'package:cryptoback_business_app/ui/screens/pass_change_screen.dart';
import 'package:cryptoback_business_app/ui/screens/password_reset_screen.dart';
import 'package:cryptoback_business_app/ui/screens/personal_information.dart';
import 'package:cryptoback_business_app/ui/screens/privacy_policy.dart';
import 'package:cryptoback_business_app/ui/screens/purchase_detail_screen.dart';
import 'package:cryptoback_business_app/ui/screens/receipt_sent_screen.dart';
import 'package:cryptoback_business_app/ui/screens/scan_qr_code.dart';
import 'package:cryptoback_business_app/ui/screens/scan_screen.dart';
import 'package:cryptoback_business_app/ui/screens/set_a_new_pass_screen.dart';
import 'package:cryptoback_business_app/ui/screens/shopper_bottom_nav.dart';
import 'package:cryptoback_business_app/ui/screens/signup_screen.dart';
import 'package:cryptoback_business_app/ui/screens/signup_through_screen.dart';
import 'package:cryptoback_business_app/ui/screens/trems_and_condition.dart';
import 'package:cryptoback_business_app/ui/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

const String welcomeRoute = '/';
const String loginRoute = '/login_screen';
const String forgotPassRoute = '/forgotPass_screen';
const String otpRoute = '/otp_screen';
const String passwordResetRoute = '/password_reset_screen';
const String setANewPassRoute = '/set_a_new_pass_screen';
const String passChangeRoute = '/pass_change_screen';
const String signupThroughRoute = '/signup_through_screen';
const String signupRoute = '/signup_screen';
const String businessStep = '/business_step_screen';
const String shopprBottomNavBarRoute = '/shopper_bottom_nav_bar_screen';
const String businessBottomNavBBarRoute = '/business_bottom_nav_bar_screen';
const String merchantDetailRoute = '/merchantDetail';
const String favoriteRoute = '/favoritesScreen';
const String notificationRoute = '/notificationScreen';
const String scanRoute = '/scan';
const String scanQrCodeRoute = '/scan_qr_code';
const String purchaseDetailRoute = '/purchaseDetailScreen';
const String receiptSentRoute = '/receiptSent';
const String cameraRoute = '/cameraScreen';
const String personalInformationRoute = '/personalInformation';
const String eWalletRoute = '/eWallet';
const String eWalletListRoute = '/eWalletListRoute';
const String businessReferralProgramView = '/BusinessReferralProgramView';
const String businessNotificationView = '/BusinessNotificationView';
const String termsAndConditionsRoute = '/termsAndConditionsRoute';
const String privacyPolicyRoute = '/privacyPolicyRoutes';
const String helpCenterRoute = '/helpCenterRoutes';
const String aboutUsRoute = '/about_us';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case welcomeRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: welcomeRoute),
          builder: (_) => WelcomeScreen(),
        );
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case forgotPassRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case otpRoute:
        final otpArgs = args as Map<String, dynamic>?;
        final source = otpArgs?['source'] ?? 'forgot_password';
        return MaterialPageRoute(builder: (_) => OtpScreen(source: source));
      case passwordResetRoute:
        return MaterialPageRoute(builder: (_) => PasswordResetScreen());
      case setANewPassRoute:
        return MaterialPageRoute(builder: (_) => SetANewPassScreen());
      case passChangeRoute:
        final passChangeArgs = args as Map<String, dynamic>?;
        final source = passChangeArgs?['source'] ?? 'password_reset';
        return MaterialPageRoute(
          builder: (_) => PassChangeScreen(source: source),
        );
      case signupThroughRoute:
        return MaterialPageRoute(builder: (_) => SignUpThroughScreen());
      case signupRoute:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case shopprBottomNavBarRoute:
        return MaterialPageRoute(builder: (_) => ShopperBottomNavBar());
      case businessBottomNavBBarRoute:
        return MaterialPageRoute(builder: (_) => BusinessBottomNavBar());
      case businessStep:
        return MaterialPageRoute(builder: (_) => BusinessSetupView());
      case merchantDetailRoute:
        return MaterialPageRoute(builder: (_) => MerchantDetailScreen());
      case favoriteRoute:
        return MaterialPageRoute(builder: (_) => FavoritesScreen());
      case notificationRoute:
        return MaterialPageRoute(builder: (_) => NotificationScreen());
      case scanRoute:
        return MaterialPageRoute(
          settings: RouteSettings(name: scanRoute),
          builder: (_) => ScanScreen(),
        );
      case scanQrCodeRoute:
        return MaterialPageRoute(builder: (_) => ScanQrCode());
      case purchaseDetailRoute:
        return MaterialPageRoute(builder: (_) => PurchaseDetailScreen());
      case receiptSentRoute:
        return MaterialPageRoute(builder: (_) => ReceiptSentScreen());
      case cameraRoute:
        return MaterialPageRoute(builder: (_) => CameraScreen());
      case personalInformationRoute:
        return MaterialPageRoute(builder: (_) => PersonalInformation());
      case eWalletRoute:
        return MaterialPageRoute(builder: (_) => EWallet());
      case eWalletListRoute:
        return MaterialPageRoute(builder: (_) => EWalletList());
      case termsAndConditionsRoute:
        return MaterialPageRoute(builder: (_) => TremsAndCondition());
      case privacyPolicyRoute:
        return MaterialPageRoute(builder: (_) => PrivacyPolicy());
      case helpCenterRoute:
        return MaterialPageRoute(builder: (_) => HelpCenter());
      case aboutUsRoute:
        return MaterialPageRoute(builder: (_) => AboutUsScreen());

      case businessReferralProgramView:
        return MaterialPageRoute(builder: (_) => BusinessReferralProgramView());
      case businessNotificationView:
        return MaterialPageRoute(builder: (_) => BusinessNotificationView());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: const Center(child: Text('ERROR')),
        );
      },
    );
  }
}
