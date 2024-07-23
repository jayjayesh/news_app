import 'package:fpdart/fpdart.dart';
import 'package:news_app/src/core/error/failures.dart';

import '../../../../core/utility/usecase.dart';
import '../entities/news_article_entity.dart';
import '../repositories/news_headline_repository.dart';

class ResetAndFetchNewsUc
    implements Usecase<List<NewsArticleEntity>, NoParams> {
  final NewsHeadlineRepository _newsHeadlineRepository;
  ResetAndFetchNewsUc(this._newsHeadlineRepository);

  @override
  Future<Either<Failure, List<NewsArticleEntity>>> call(NoParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
