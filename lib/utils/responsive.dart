import 'package:flutter/material.dart';

import 'enums.dart';

class Responsive {
  static T? getResponsiveDesign<T>({
    ValueGetter<T>? tablet,
    ValueGetter<T>? smallTablet,
    ValueGetter<T>? mobile,
  }) {
    switch (designType) {
      case DesignType.tablet:
        return tablet?.call();
      case DesignType.smallTablet:
        return smallTablet?.call();
      case DesignType.mobile:
        return mobile?.call();
    }
  }

  static DesignType get designType {
    final window = WidgetsBinding.instance.window;
    final size = window.physicalSize / window.devicePixelRatio;
    if (size.width >= 800) {
      return DesignType.tablet;
    } else if (size.width >= 600) {
      return DesignType.smallTablet;
    }
    return DesignType.mobile;
  }
}
