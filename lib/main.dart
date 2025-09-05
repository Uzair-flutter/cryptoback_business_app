import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bitcoin_back.dart';
import 'services/locator.dart';
import 'services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServices();
  await locator<StorageService>().init();
  await GoogleFonts.pendingFonts([GoogleFonts.montserratTextTheme()]);
  await ScreenUtil.ensureScreenSize();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Size _getDesignSize() {
    // Get the actual screen size
    final window = WidgetsBinding.instance.window;
    final size = window.physicalSize / window.devicePixelRatio;
    // Return appropriate design size based on screen width
    if (size.width >= 1200) {
      log('LARGE: ${size.width}');
      return Size(1200, 1600);
      // Large tablets/Desktop
    } else if (size.width >= 800) {
      log('MEDIUM: ${size.width}');
      return Size(768, 1024); // Tablets
    } else if (size.width >= 600) {
      log('SMALL: ${size.width}');
      return Size(600, 900); // Small tablets
    } else {
      log('DEFAULT: ${size.width}');
      return const Size(393, 852);
    }
  }

  runApp(
    ProviderScope(
      child: ScreenUtilInit(
        designSize: _getDesignSize(),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BitcoinBack(),
      ),
    ),
  );
}
