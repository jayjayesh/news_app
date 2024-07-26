import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/core/params/fetch_news_source_headline_params.dart';
import '../../../../core/constants/app_config.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/params/fetch_news_headline_params.dart';
import '../../domain/repositories/news_headline_repository.dart';
import 'news_source_page_state.dart';

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
    fetchSourceNewsHeadline();
  }

  Future<void> fetchSourceNewsHeadline() async {
    if (state.status == STATUS.loading || state.isPaginationEnd) {
      return;
    }

    if (state.source.isEmpty) {
      return;
    }

    state = state.copyWith(
      status: STATUS.loading,
      paginationPage: state.paginationPage + 1,
    );

    var queryParameters = FetchSourceNewsHeadlineParams(
      source: state.source.replaceAll(' ', '-'), // must have source 
      country: '', // country must be empty or null
      page: state.paginationPage,
      pageSize: AppConstant.pageSize,
      apiKey: appConfig.newsApiKey,
    );

    var response = await newsHeadlineRepository
        .fetchNewsHeadlineRepoRequest(queryParameters);

    response.fold((l) {
      state = state.copyWith(
        status: STATUS.error,
      );
    }, (r) {
      state = state.copyWith(
        status: STATUS.loaded,
        isPaginationEnd: r.isEmpty,
        // isPaginationEnd:
        //     state.newArticles.length >= (response.totalResults ?? 0),
        newArticles: [...state.newArticles, ...r],
      );
    });
  }
}
