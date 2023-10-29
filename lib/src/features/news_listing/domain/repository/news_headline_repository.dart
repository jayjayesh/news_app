import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/src/core/network/dio_exceptions.dart';
import 'package:news_app/src/core/utility/app_toast.dart';
import 'package:news_app/src/features/news_listing/data/api/news_api.dart';
import 'package:news_app/src/features/news_listing/data/model/news_article_model.dart';
import 'package:news_app/src/features/news_listing/data/model/news_headline_response.dart';

abstract class NewsHeadlineRepository {
  Future<NewsHeadlinesResponse> fetchNewsHeadlineRepoRequest(
      Map<String, dynamic> queryParameters);
}
