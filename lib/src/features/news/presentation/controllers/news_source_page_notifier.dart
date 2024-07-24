import 'package:flutter_riverpod/flutter_riverpod.dart';
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

    var queryParameters = FetchNewsHeadlineParams(
      country: AppConstant.newsApiCountry,
      page: state.paginationPage,
      pageSize: AppConstant.pageSize,
      apiKey: appConfig.newsApiKey,
    );

    if (state.source.isNotEmpty) {
      queryParameters = queryParameters.copyWith(
        source: state.source.replaceAll(' ', '-'),
        country: null,
      );
    }

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
