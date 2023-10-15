import 'package:news_app/src/features/news_listing/data/model/news_article_model.dart';

enum NewsHeadlinePageStatus {
  initial,
  loading,
  loaded,
  error,
}

class NewsHeadlinePageState {
  NewsHeadlinePageState({
    this.status = NewsHeadlinePageStatus.initial,
    this.paginationPage = 0,
    this.isPaginationEnd = false,
    this.source = '',
    this.newArticles = const [],
  });

  NewsHeadlinePageStatus? status;
  int paginationPage;
  bool isPaginationEnd;
  String source;
  List<NewsArticleModel> newArticles;

  NewsHeadlinePageState copyWith({
    NewsHeadlinePageStatus? status,
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
