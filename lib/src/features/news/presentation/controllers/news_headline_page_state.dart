import 'package:equatable/equatable.dart';
import 'package:news_app/src/core/constants/app_constants.dart';
import 'package:news_app/src/features/news/data/models/news_article_model.dart';
import 'package:news_app/src/features/news/domain/entities/news_article_entity.dart';

class NewsHeadlinePageState extends Equatable {
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
  List<NewsArticleEntity> newArticles;

  NewsHeadlinePageState copyWith({
    STATUS? status,
    int? paginationPage,
    bool? isPaginationEnd,
    String? source,
    List<NewsArticleEntity>? newArticles,
  }) {
    return NewsHeadlinePageState(
      status: status ?? this.status,
      paginationPage: paginationPage ?? this.paginationPage,
      isPaginationEnd: isPaginationEnd ?? this.isPaginationEnd,
      source: source ?? this.source,
      newArticles: newArticles ?? this.newArticles,
    );
  }

  @override
  List<Object?> get props => [
        status,
        paginationPage,
        isPaginationEnd,
        source,
        newArticles,
      ];
}
