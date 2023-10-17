import 'package:news_app/src/core/constants/app_config.dart';

class Endpoints {
  // base url
  static String newsHeadline = "${appConfig.baseUrl}/v2/top-headlines";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;
}
