import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/src/core/network/dio_exceptions.dart';
import 'package:news_app/src/core/utility/app_toast.dart';
import 'package:news_app/src/features/news_listing/data/api/news_api.dart';
import 'package:news_app/src/features/news_listing/data/model/news_article_model.dart';
import 'package:news_app/src/features/news_listing/data/model/news_headline_response.dart';

class NewsHeadlineRepository {
  final NewsAPI _newsAPI;

  NewsHeadlineRepository(this._newsAPI);

  Future<NewsHeadlinesResponse> fetchNewsHeadline(
      Map<String, dynamic>? queryParameters) async {
    try {
      final res = await _newsAPI.fetchNewsHeadlineApiRequest(queryParameters);
      final newsHeadlineResponse = NewsHeadlinesResponse.fromJson(res);
      return newsHeadlineResponse;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      debugPrint(errorMessage.toString());
      AppToast.show(message: errorMessage.toString());
      rethrow;
    }
  }
}
