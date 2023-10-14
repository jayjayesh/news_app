import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

enum SnackbarType {
  normal,
  success,
  error,
}

class AppToast {
  ///
  static void show({
    required String message,
    Duration duration = const Duration(seconds: 5),
    Color backgroundColor = AppColors.grey,
    SnackbarType type = SnackbarType.normal,
  }) {
    ///
    /// Guard
    if (message.isEmpty) {
      return;
    }

    //-----------------------
    EasyLoading.instance
      ..displayDuration = duration
      ..backgroundColor = backgroundColor
      ..toastPosition = EasyLoadingToastPosition.bottom
      ..animationStyle = EasyLoadingAnimationStyle.offset
      ..animationDuration = const Duration(milliseconds: 400)
      ..textAlign = TextAlign.start
      ..textPadding = EdgeInsets.zero
      ..userInteractions = true
      ..dismissOnTap = true;
    //..loadingStyle = AppUtility.systemThemeIsDark() ? EasyLoadingStyle.light : EasyLoadingStyle.dark;

    EasyLoading.showToast(message);
  }
}
