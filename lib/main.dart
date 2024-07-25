import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/core/constants/app_config.dart';

import 'src/app.dart';
import 'src/features/settings/settings_controller.dart';
import 'src/features/settings/settings_service.dart';

void main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();
  appConfig = await loadConfig();

  /// print vs debugPrint : https://stackoverflow.com/a/66841392
  if (kDebugMode) {
    debugPrint = (String? message, {int? wrapWidth}) {
      // alice.addLog(AliceLog(message: message ?? ''));
      // NOTE: make sure : do not accidently debugPrint() in this code block
      print('$message');
    };
  } else {
    // hide logs in production
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(ProviderScope(child: MyApp(settingsController: settingsController)));
}
