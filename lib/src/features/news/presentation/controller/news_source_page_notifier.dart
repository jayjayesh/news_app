import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/core/constants/app_config.dart';
import 'package:news_app/src/core/constants/app_constants.dart';
import 'package:news_app/src/features/news/domain/repository/news_headline_repository.dart';
import 'package:news_app/src/features/news/presentation/controller/news_source_page_state.dart';

class NewsSourcePageNotifier extends StateNotifier<NewsSourcePageState> {
  final NewsHeadlineRepository newsHeadlineRepository;
  final String source;

// constructor : initMethod()
  NewsSourcePageNotifier(this.newsHeadlineRepository, this.source)
      : super(NewsSourcePageState()) {
    ///
    state = state.copyWith(
      paginationPage: 0,
      isPaginationEnd: false,
      source: source,
      newArticles: const [],
    );
    fetchNewsHeadline();
  }

  Future<void> fetchNewsHeadline() async {
    if (state.status == STATUS.loading || state.isPaginationEnd) {
      return;
    }

    state = state.copyWith(
      status: STATUS.loading,
      paginationPage: state.paginationPage + 1,
    );

    var queryParameters = <String, dynamic>{};

    if (state.source.isNotEmpty) {
      queryParameters = {
        'sources': state.source.replaceAll(' ', '-'),
        'page': state.paginationPage,
        'pageSize': AppConstant.pageSize,
        'apiKey': appConfig.newsApiKey,
      };
    } else {
      queryParameters = {
        'country': AppConstant.newsApiCountry,
        'page': state.paginationPage,
        'pageSize': AppConstant.pageSize,
        'apiKey': appConfig.newsApiKey,
      };
    }

    try {
      var response = await newsHeadlineRepository
          .fetchNewsHeadlineRepoRequest(queryParameters);
      if (response.articles!.isNotEmpty) {}

      state = state.copyWith(
        status: STATUS.loaded,
        isPaginationEnd: response.articles?.isEmpty,
        // isPaginationEnd:
        //     state.newArticles.length >= (response.totalResults ?? 0),
        newArticles: [...state.newArticles, ...response.articles ?? []],
      );
    } catch (e) {
      state = state.copyWith(
        status: STATUS.error,
      );
    }
  }
}
