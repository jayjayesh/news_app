import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//
late final AppConfig appConfig;

//
class AppConfig {
  final String baseUrl;
  final String newsApiKey;

  AppConfig({required this.baseUrl, required this.newsApiKey});
}

//
Future<AppConfig> loadConfig() async {
  String raw;

  try {
    raw = await rootBundle.loadString('assets/app_config/app_config.json');

    final config = json.decode(raw) as Map<String, dynamic>;

    return AppConfig(
      baseUrl: config['baseUrl'] as String,
      newsApiKey: config['newsApiKey'] as String,
    );
  } catch (e) {
    debugPrint(
      'Error while loading project configuration, please make sure '
      'that the file located at /assets/config/config.json '
      'exists and that it contains the correct configuration.'
      '$e',
    );
    rethrow;
  }
}
