import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/src/core/constants/app_config.dart';
import 'package:news_app/src/core/constants/app_constants.dart';
import 'package:news_app/src/features/news/data/models/news_article_model/news_article_model.dart';
import 'package:news_app/src/features/news/data/models/news_headline_response.dart';
import 'package:news_app/src/features/news/domain/repositories/news_headline_repository.dart';
import 'package:news_app/src/features/news/presentation/controllers/news_headline_page_notifier.dart';
import 'package:news_app/src/features/news/presentation/controllers/news_headline_page_state.dart';

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

  group('news headline page notifier ...', () {
    test('fetchNewsHeadlines() should load news headlines from the repository',
        () async {
      // Arrange
      when(() => mockNewsHeadlineRepository.fetchNewsHeadlineRepoRequest(any()))
          .thenAnswer((_) => Future.value(newsHeadlinesResponseObjc));

      // Act
      await newsHeadlinePageNotifier.fetchNewsHeadline();

      // Assert
      expectLater(newsHeadlinePageNotifier.state.status, STATUS.loaded);
      expectLater(
          newsHeadlinePageNotifier.state.newArticles.first.title, 'Title 1');
    });
  });
}
