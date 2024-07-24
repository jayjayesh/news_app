import 'package:flutter/widgets.dart';
import 'package:fpdart/fpdart.dart';
import 'package:news_app/src/core/constants/app_constants.dart';
import 'package:news_app/src/core/error/exceptions.dart';
import 'package:news_app/src/core/error/failures.dart';
import 'package:news_app/src/core/internet_connection_checker/connection_checker.dart';
import 'package:news_app/src/core/utility/app_toast.dart';
import 'package:news_app/src/features/news/data/datasource/news_remote_data_source.dart';
import 'package:news_app/src/features/news/data/models/news_article_model.dart';
import 'package:news_app/src/features/news/data/models/news_headline_response.dart';
import 'package:news_app/src/features/news/domain/repositories/news_headline_repository.dart';

import '../../../../core/params/fetch_news_headline_params.dart';
import '../../domain/entities/news_article_entity.dart';

class NewsHeadlineRepositoryImpl implements NewsHeadlineRepository {
  final NewsRemoteDataSource newsRemoteDataSource;
  final ConnectionChecker connectionChecker;

  NewsHeadlineRepositoryImpl(
    this.newsRemoteDataSource,
    this.connectionChecker,
  );

  @override
  Future<Either<Failure, List<NewsArticleEntity>>> fetchNewsHeadlineRepoRequest(
     FetchNewsHeadlineParams queryParameters) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure(AppConstant.noConnectionErrorMessage));
      }
      final res = await newsRemoteDataSource
          .fetchNewsHeadlineApiRequest(queryParameters);
      final newsHeadlineResponse = NewsHeadlinesResponse.fromJson(res);
      if (newsHeadlineResponse.articles == null) {
        return left(Failure('No articles found!'));
      }
      return right(newsHeadlineResponse.articles!);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
