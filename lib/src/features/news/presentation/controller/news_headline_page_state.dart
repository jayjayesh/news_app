import 'package:news_app/src/core/constants/app_constants.dart';
import 'package:news_app/src/features/news/data/model/news_article_model/news_article_model.dart';

class NewsHeadlinePageState {
  NewsHeadlinePageState({
    this.status = STATUS.initial,
    this.paginationPage = 0,
    this.isPaginationEnd = false,
    this.source = '',
    this.newArticles = const [],
  });

  STATUS? status;
  int paginationPage;
  bool isPaginationEnd;
  String source;
  List<NewsArticleModel> newArticles;

  NewsHeadlinePageState copyWith({
    STATUS? status,
    int? paginationPage,
    bool? isPaginationEnd,
    String? source,
    List<NewsArticleModel>? newArticles,
  }) {
    return NewsHeadlinePageState(
      status: status ?? this.status,
      paginationPage: paginationPage ?? this.paginationPage,
      isPaginationEnd: isPaginationEnd ?? this.isPaginationEnd,
      source: source ?? this.source,
      newArticles: newArticles ?? this.newArticles,
    );
  }
}
