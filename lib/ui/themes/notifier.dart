import 'package:flutter/material.dart';

import '../../services/locator.dart';
import '../../services/storage_service.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  ThemeNotifier() {
    _loadTheme();
  }

  void _loadTheme() async {
    _themeMode = locator<StorageService>().getThemeMode();
    notifyListeners();
  }

  void setThemeMode(ThemeMode themeMode) async {
    if (_themeMode == themeMode) return;

    _themeMode = themeMode;
    await locator<StorageService>().saveThemeMode(themeMode);
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      setThemeMode(ThemeMode.dark);
    } else {
      setThemeMode(ThemeMode.light);
    }
  }
}
