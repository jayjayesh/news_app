import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/core/shared_provider/shared_providers.dart';
import 'package:news_app/src/features/news/data/data_source/news_remote_data_source.dart';
import 'package:news_app/src/features/news/data/repository/news_headline_repository_impl.dart';
import 'package:news_app/src/features/news/domain/repository/news_headline_repository.dart';
import 'package:news_app/src/features/news/presentation/controller/news_headline_page_notifier.dart';
import 'package:news_app/src/features/news/presentation/controller/news_headline_page_state.dart';
import 'package:news_app/src/features/news/presentation/controller/news_source_page_notifier.dart';
import 'package:news_app/src/features/news/presentation/controller/news_source_page_state.dart';

final newsApiProvider = Provider<NewsAPI>((ref) {
  return NewsAPI(ref.read(dioClientProvider));
});

final newsHeadlineRepositoryProvider = Provider<NewsHeadlineRepository>(
  (ref) {
    return NewsHeadlineRepositoryImpl(ref.read(newsApiProvider));
  },
);

final newsHeadlinePageNotifierProvider = StateNotifierProvider.autoDispose<
    NewsHeadlinePageNotifier, NewsHeadlinePageState>((ref) {
  return NewsHeadlinePageNotifier(ref.read(newsHeadlineRepositoryProvider));
});

final newsSourcePageNotifierProvider = StateNotifierProvider.autoDispose<
    NewsSourcePageNotifier, NewsSourcePageState>(
  (ref) {
    final source = ref.read(newsHeadlinePageNotifierProvider).source;

    return NewsSourcePageNotifier(
      ref.read(newsHeadlineRepositoryProvider),
      source,
    );
  },
);
