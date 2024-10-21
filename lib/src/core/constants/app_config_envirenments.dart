import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get filename {
    if (kReleaseMode) {
      return 'env.production';
    }

    return 'env.development';
  }

  static String get apiEndPoint {
    return dotenv.env['API_ENDPOINT'] ?? "API_ENDPOINT not found";
  }

  static String get newsApiKey {
    return dotenv.env['NEWS_API_KEY'] ?? "NEWS_API_KEY not found";
  }
}
