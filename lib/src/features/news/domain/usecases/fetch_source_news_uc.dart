import 'package:fpdart/fpdart.dart';
import 'package:news_app/src/core/utility/usecase.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/params/fetch_news_source_headline_params.dart';
import '../entities/news_article_entity.dart';
import '../entities/news_article_source_entity.dart';
import '../repositories/news_headline_repository.dart';

class FetchSourceNewsUc
    implements Usecase<List<NewsArticleEntity>, FetchSourceNewsHeadlineParams> {
  final NewsHeadlineRepository _newsHeadlineRepository;
  FetchSourceNewsUc(this._newsHeadlineRepository);

  @override
  Future<Either<Failure, List<NewsArticleEntity>>> call(
      FetchSourceNewsHeadlineParams params) {
    return _newsHeadlineRepository.fetchNewsHeadlineRepoRequest(params);
  }
}
