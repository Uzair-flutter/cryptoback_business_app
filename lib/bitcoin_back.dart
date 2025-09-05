import 'package:cryptoback_business_app/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_routes.dart';
import 'ui/themes/notifier.dart';

final themeProvider = ChangeNotifierProvider((_) => ThemeNotifier());

class BitcoinBack extends ConsumerWidget {
  const BitcoinBack({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ScreenUtil.init(context);
    final ThemeMode themeMode = ref.watch(themeProvider).themeMode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bitcoin Back',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      //  home: BusinessReferralProgramView(),
      themeMode: themeMode,
      theme: AppTheme.lightTheme,
      //  darkTheme: AppTheme.darkTheme,
    );
  }
}
