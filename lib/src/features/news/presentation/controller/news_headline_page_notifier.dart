import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/core/constants/app_config.dart';
import 'package:news_app/src/core/constants/app_constants.dart';
import 'package:news_app/src/features/news/data/repository/news_headline_repository_impl.dart';
import 'package:news_app/src/features/news/domain/repository/news_headline_repository.dart';
import 'package:news_app/src/features/news/presentation/controller/news_headline_page_state.dart';
import 'package:news_app/src/features/news/presentation/view/news_headline_page.dart';
import 'package:news_app/src/features/news/presentation/view/news_source_page.dart';

class NewsHeadlinePageNotifier extends StateNotifier<NewsHeadlinePageState> {
  final NewsHeadlineRepository newsHeadlineRepository;

  // constructor : initMethod()
  NewsHeadlinePageNotifier(this.newsHeadlineRepository)
      : super(NewsHeadlinePageState()) {
    fetchNewsHeadline();
  }

  Future<void> pullToRefresh() async {
    state = state.copyWith(
      paginationPage: 0,
      isPaginationEnd: false,
      newArticles: const [],
    );
    fetchNewsHeadline();
  }

  void onTapNewsSource(String source, BuildContext context) {
    state = state.copyWith(
      source: source,
    );
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => NewsSourceListingPage()));
  }

  void onTapAllHeadline() {
    state = state.copyWith(
      source: '',
      paginationPage: 0,
      isPaginationEnd: false,
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

    // if (state.source.isNotEmpty) {
    //   queryParameters = {
    //     'sources': state.source.replaceAll(' ', '-'),
    //     'page': state.paginationPage,
    //     'pageSize': AppConstant.pageSize,
    //     'apiKey': appConfig.newsApiKey,
    //   };
    // } else
    {
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
