import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/src/core/constants/app_config.dart';
import 'package:news_app/src/core/constants/app_constants.dart';
import 'package:news_app/src/core/network/constant/endpoints.dart';

import 'api_client_unit_test.dart';

void main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();
  appConfig = await loadConfig();

  var page = '1';
  var pageSize = '10';

  group("API-Test : News Module :", () {
    test("API : ${Endpoints.newsHeadline}", () async {
      final requestParam = {
        'country': AppConstant.newsApiCountry,
        'page': page,
        'pageSize': pageSize,
        'apiKey': appConfig.newsApiKey,
      };
      String url = Endpoints.newsHeadline;

      ///
      await ApiClientForUnitTest.get(url: url, params: requestParam)
          .then((response) async {
        // final responseData = await response.stream.bytesToString();
        // print("Response Data ${json.decode(responseData)}");
        expect(response.statusCode, 200);
      });
    });

    test("API : ${Endpoints.newsHeadline}", () async {
      final requestParam = {
        'sources': 'techcrunch',
        'page': page,
        'pageSize': pageSize,
        'apiKey': appConfig.newsApiKey,
      };
      String url = Endpoints.newsHeadline;

      ///
      await ApiClientForUnitTest.get(url: url, params: requestParam)
          .then((response) async {
        // final responseData = await response.stream.bytesToString();
        // print("Response Data ${json.decode(responseData)}");
        expect(response.statusCode, 200);
      });
    });
  });
}
