import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../exceptions/app_exception.dart';

abstract class BaseNotifier<T> extends StateNotifier<T> {
  BaseNotifier(super.state);

  Future<void> runSafely(AsyncCallback callback) async {
    try {
      await callback.call();
    } on AppException catch (e, s) {
      log(e.message, stackTrace: s);
      handleError(e.message);
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      handleError('Something went wrong!');
    }
  }

  void handleError(String message);
}
