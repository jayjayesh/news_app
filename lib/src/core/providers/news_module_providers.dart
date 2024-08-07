import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/core/internet_connection_checker/connection_checker.dart';
import 'package:news_app/src/core/shared_provider/shared_providers.dart';
import 'package:news_app/src/features/news/data/datasource/news_remote_data_source.dart';
import 'package:news_app/src/features/news/data/repositories/news_headline_repository_impl.dart';
import 'package:news_app/src/features/news/domain/repositories/news_headline_repository.dart';
import 'package:news_app/src/features/news/presentation/controllers/news_headline_page_notifier.dart';
import 'package:news_app/src/features/news/presentation/controllers/news_headline_page_state.dart';
import 'package:news_app/src/features/news/presentation/controllers/news_source_page_notifier.dart';
import 'package:news_app/src/features/news/presentation/controllers/news_source_page_state.dart';

import '../../features/news/domain/usecases/fetch_news_uc.dart';

final newsRemoteDataProvider = Provider<NewsRemoteDataSource>((ref) {
  return NewsRemoteDataSourceImpl(ref.read(dioClientProvider));
});

final newsHeadlineRepositoryProvider = Provider<NewsHeadlineRepository>(
  (ref) {
    return NewsHeadlineRepositoryImpl(
      ref.read(newsRemoteDataProvider),
      ref.read(connectionCheckerProvider),
    );
  },
);


final fetchNewsUc = Provider<FetchNewsUc>((ref) {
  return FetchNewsUc(ref.read(newsHeadlineRepositoryProvider));
});


final newsHeadlinePageNotifierProvider = StateNotifierProvider.autoDispose<
    NewsHeadlinePageNotifier, NewsHeadlinePageState>((ref) {
  return NewsHeadlinePageNotifier(ref.read(fetchNewsUc));
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
