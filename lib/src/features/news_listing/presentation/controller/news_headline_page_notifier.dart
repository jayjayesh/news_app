import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/core/constants/app_constants.dart';
import 'package:news_app/src/features/news_listing/data/repository/news_headline_repository.dart';
import 'package:news_app/src/features/news_listing/presentation/controller/news_headline_page_state.dart';

class NewsHeadlinePageNotifier extends StateNotifier<NewsHeadlinePageState> {
  final NewsHeadlineRepository newsHeadlineRepository;

  NewsHeadlinePageNotifier(this.newsHeadlineRepository)
      : super(NewsHeadlinePageState()) {
    fetchNewsHeadlines();
  }

  Future<void> pullToRefresh() async {
    state = state.copyWith(
      paginationPage: 0,
      isPaginationEnd: false,
      newArticles: const [],
    );
    fetchNewsHeadlines();
  }

  void onTapNewsSource(String source) {
    state = state.copyWith(
      paginationPage: 0,
      isPaginationEnd: false,
      source: source,
      newArticles: const [],
    );
    fetchNewsHeadlines();
  }

  void onTapAllHeadline() {
    state = state.copyWith(
      source: '',
      paginationPage: 0,
      isPaginationEnd: false,
      newArticles: const [],
    );
    fetchNewsHeadlines();
  }

  Future<void> fetchNewsHeadlines() async {
    if (state.status == NewsHeadlinePageStatus.loading ||
        state.isPaginationEnd) {
      return;
    }

    state = state.copyWith(
      status: NewsHeadlinePageStatus.loading,
      paginationPage: state.paginationPage + 1,
    );

    var queryParameters = <String, dynamic>{};

    if (state.source.isNotEmpty) {
      queryParameters = {
        'sources': state.source,
        'page': state.paginationPage,
        'pageSize': AppConstant.pageSize,
        'apiKey': AppConstant.newsApiKey,
      };
    } else {
      queryParameters = {
        'country': AppConstant.newsApiCountry,
        'page': state.paginationPage,
        'pageSize': AppConstant.pageSize,
        'apiKey': AppConstant.newsApiKey,
      };
    }

    try {
      var response =
          await newsHeadlineRepository.fetchNewsHeadline(queryParameters);
      if (response.articles!.isNotEmpty) {}

      state = state.copyWith(
        status: NewsHeadlinePageStatus.loaded,
        isPaginationEnd: response.articles?.isEmpty,
        // isPaginationEnd:
        //     state.newArticles.length >= (response.totalResults ?? 0),
        newArticles: [...state.newArticles, ...response.articles ?? []],
      );
    } catch (e) {
      state = state.copyWith(
        status: NewsHeadlinePageStatus.error,
      );
    }
  }
}
