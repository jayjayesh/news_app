import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/core/shared_provider/shared_providers.dart';
import 'package:news_app/src/features/news_listing/data/api/news_api.dart';
import 'package:news_app/src/features/news_listing/data/repository/news_headline_repository.dart';
import 'package:news_app/src/features/news_listing/presentation/controller/news_headline_page_notifier.dart';
import 'package:news_app/src/features/news_listing/presentation/controller/news_headline_page_state.dart';

final newsApiProvider = Provider<NewsAPI>((ref) {
  return NewsAPI(ref.read(dioClientProvider));
});

final newsHeadlineRepositoryProvider = Provider<NewsHeadlineRepository>((ref) {
  return NewsHeadlineRepository(ref.read(newsApiProvider));
});

final newsHeadlinePageNotifierProvider = StateNotifierProvider.autoDispose<
    NewsHeadlinePageNotifier, NewsHeadlinePageState>((ref) {
  return NewsHeadlinePageNotifier(ref.read(newsHeadlineRepositoryProvider));
});
