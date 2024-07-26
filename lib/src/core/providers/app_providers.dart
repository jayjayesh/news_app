import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Here is concept of Providers, StateProvider, StateNotifierProvider
/// Providers : use it for immutable static data
/// StateProvider : use it for single data that you want to change over time
/// StateNotifierProvider : use it for custome class
/// For More Info : https://pub.dev/packages/flutter_riverpod, https://youtu.be/pwflXIA-6YQ?si=X_1ObV_BejObDEht
///
/// Here is example :
///
/// Conclusion :
/// 1. Here you don't need to use StateNotifierProvider since we need to handle single data ThemeMode
/// 2. We can use Provider for Dependency Injection ( DI ) [newsApiProvider]
/// 3. We can use StateProvider for ThemeData
/// 4. We can use StateNotifierProvider for custome class like screen/page State ( NewsHeadlinePageState )
///

// StateProvider
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);

// StateNotifierProvider
final themeModeProvider2 =
    StateNotifierProvider<AppThemeMode, ThemeMode>((ref) => AppThemeMode());

class AppThemeMode extends StateNotifier<ThemeMode> {
  AppThemeMode() : super(ThemeMode.light);

  void updateThemeMode(ThemeMode themeMode) {
    state = themeMode;
  }

  void toggleThemeMode() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
