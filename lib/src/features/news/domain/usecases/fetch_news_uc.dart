import 'package:fpdart/fpdart.dart';
import 'package:news_app/src/core/params/fetch_news_headline_params.dart';
import 'package:news_app/src/core/utility/usecase.dart';
import 'package:news_app/src/features/news/domain/entities/news_article_entity.dart';
import '../../../../core/error/failures.dart';
import '../repositories/news_headline_repository.dart';

class FetchNewsUc
    implements Usecase<List<NewsArticleEntity>, FetchNewsHeadlineParams> {
  final NewsHeadlineRepository _newsHeadlineRepository;
  FetchNewsUc(this._newsHeadlineRepository);

  @override
  Future<Either<Failure, List<NewsArticleEntity>>> call(
      FetchNewsHeadlineParams params) {
    return _newsHeadlineRepository.fetchNewsHeadlineRepoRequest(params);
  }
}

// class FetchNewsUcParams {
//   final String country;
//   final int page;
//   final int pageSize;
//   final String apiKey;

//   FetchNewsUcParams(
//       {required this.country,
//       required this.page,
//       required this.pageSize,
//       required this.apiKey});
// }
