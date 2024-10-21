import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/core/constants/app_config_envirenments.dart';
import 'package:news_app/src/core/params/fetch_news_headline_params.dart';
import '../../../../core/constants/app_config.dart';
import '../../../../core/constants/app_constants.dart';
import '../../domain/usecases/fetch_news_uc.dart';
import 'news_headline_page_state.dart';
import '../pages/news_source_page.dart';

class NewsHeadlinePageNotifier extends StateNotifier<NewsHeadlinePageState> {
  final FetchNewsUc fetchNewsUc;

  // constructor : initMethod()
  NewsHeadlinePageNotifier(this.fetchNewsUc) : super(NewsHeadlinePageState()) {
    // Delay is added to pass news_headline_page_notifier_test.dart
    Future.delayed(Durations.extralong4, () {
      fetchNewsHeadline();
    });
    // startTimer();
  }

  // NOTE: Use this code to exceed api limit : status code 426
  /*
  static late Timer _timer;
  static int _start = 1000;

  void startTimer() {
    const twoSec = const Duration(seconds: 2);
    _timer = Timer.periodic(
      twoSec,
      (Timer timer) {
        if (_start == 0) {
          timer.cancel();
        } else {
          _start--;
          fetchNewsHeadline();
        }
      },
    );
  }

  */

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
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const NewsSourceListingPage()));
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

    var queryParameters = FetchNewsHeadlineParams(
      country: AppConstant.newsApiCountry,
      page: state.paginationPage,
      pageSize: AppConstant.pageSize,
      apiKey: Environment.newsApiKey,
    );

    var response = await fetchNewsUc.call(queryParameters);

    response.fold(
      (l) {
        state = state.copyWith(
          status: STATUS.error,
        );
      },
      (r) {
        state = state.copyWith(
          status: STATUS.loaded,
          isPaginationEnd: r.isEmpty,
          // isPaginationEnd:
          //     state.newArticles.length >= (response.totalResults ?? 0),
          newArticles: [...state.newArticles, ...r],
        );
      },
    );
  }
}
