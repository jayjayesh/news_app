import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/src/core/network/dio_exceptions.dart';
import 'package:news_app/src/core/utility/app_toast.dart';
import 'package:news_app/src/features/news/data/api/news_api.dart';
import 'package:news_app/src/features/news/data/model/news_article_model/news_article_model.dart';
import 'package:news_app/src/features/news/data/model/news_headline_response.dart';
import 'package:news_app/src/features/news/domain/repository/news_headline_repository.dart';

class NewsHeadlineRepositoryImpl implements NewsHeadlineRepository {
  final NewsAPI _newsAPI;

  NewsHeadlineRepositoryImpl(this._newsAPI);

  @override
  Future<NewsHeadlinesResponse> fetchNewsHeadlineRepoRequest(
      Map<String, dynamic> queryParameters) async {
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
