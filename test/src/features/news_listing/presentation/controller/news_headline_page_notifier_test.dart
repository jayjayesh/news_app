import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/src/core/constants/app_config.dart';
import 'package:news_app/src/features/news_listing/data/model/news_article_model.dart';
import 'package:news_app/src/features/news_listing/data/model/news_headline_response.dart';
import 'package:news_app/src/features/news_listing/domain/repository/news_headline_repository.dart';
import 'package:news_app/src/features/news_listing/presentation/controller/news_headline_page_notifier.dart';
import 'package:news_app/src/features/news_listing/presentation/controller/news_headline_page_state.dart';

class MockNewsHeadlineRepository extends Mock
    implements NewsHeadlineRepository {}
// class MockAppConfig extends Mock implements AppConfig {}

void main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();
  appConfig = await loadConfig();
  MockNewsHeadlineRepository mockNewsHeadlineRepository =
      MockNewsHeadlineRepository();
  NewsHeadlinePageNotifier newsHeadlinePageNotifier =
      NewsHeadlinePageNotifier(mockNewsHeadlineRepository);

  var newsHeadlinesResponseObjc = NewsHeadlinesResponse(
    status: 'ok',
    totalResults: 38,
    articles: [
      NewsArticleModel(
        title: 'Title 1',
        description: 'Description 1',
        urlToImage: 'https://newsapi.com/image.png',
        url: 'https://newsapi.com/article1',
      ),
    ],
  );

  setUpAll(() {
    mockNewsHeadlineRepository = MockNewsHeadlineRepository();
    newsHeadlinePageNotifier =
        NewsHeadlinePageNotifier(mockNewsHeadlineRepository);
  });

  group('news headline page notifier ...', () {
    test('fetchNewsHeadlines() should load news headlines from the repository',
        () async {
      // Arrange
      when(mockNewsHeadlineRepository.fetchNewsHeadlineRepoRequest({}))
          .thenAnswer((_) async => newsHeadlinesResponseObjc);

      // Act
      await newsHeadlinePageNotifier.fetchNewsHeadline();

      // Assert
      expect(
          newsHeadlinePageNotifier.state.status, NewsHeadlinePageStatus.loaded);
      expect(newsHeadlinePageNotifier.state.newArticles.first.title, 'Title 1');
    });
  });
}
