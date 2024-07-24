import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:fpdart/fpdart.dart';
import 'package:news_app/src/core/error/failures.dart';
import 'package:news_app/src/core/utility/app_toast.dart';
import 'package:news_app/src/features/news/data/datasource/news_remote_data_source.dart';
import 'package:news_app/src/features/news/data/models/news_article_model.dart';
import 'package:news_app/src/features/news/data/models/news_headline_response.dart';
import 'package:news_app/src/features/news/domain/entities/news_article_entity.dart';

import '../../../../core/params/fetch_news_headline_params.dart';

abstract class NewsHeadlineRepository {
  Future<Either<Failure, List<NewsArticleEntity>>> fetchNewsHeadlineRepoRequest(
      FetchNewsHeadlineParams queryParameters);
}
