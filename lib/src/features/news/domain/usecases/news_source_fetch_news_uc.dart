import 'package:fpdart/fpdart.dart';
import 'package:news_app/src/core/utility/usecase.dart';

import '../../../../core/error/failures.dart';
import '../entities/news_article_source_entity.dart';
import '../repositories/news_headline_repository.dart';

class NewsSourceFetchNewsUc
    implements Usecase<List<NewsArticleSourceEntity>, NoParams> {
  final NewsHeadlineRepository _newsHeadlineRepository;
  NewsSourceFetchNewsUc(this._newsHeadlineRepository);

  @override
  Future<Either<Failure, List<NewsArticleSourceEntity>>> call(NoParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
