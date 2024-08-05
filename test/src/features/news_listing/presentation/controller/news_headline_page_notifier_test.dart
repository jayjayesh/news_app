import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/src/core/constants/app_config.dart';
import 'package:news_app/src/core/constants/app_constants.dart';
import 'package:news_app/src/core/params/fetch_news_headline_params.dart';
import 'package:news_app/src/features/news/domain/entities/news_article_entity.dart';
import 'package:news_app/src/features/news/domain/usecases/fetch_news_uc.dart';
import 'package:news_app/src/features/news/presentation/controllers/news_headline_page_notifier.dart';

///
/// Ref Tutorial : Reso Coder : https://youtu.be/hUAUAkIZmX0?si=HbMhVHMbJHRWHNIg
///

class MockFetchNewsUc extends Mock implements FetchNewsUc {}
// class MockAppConfig extends Mock implements AppConfig {}

void main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();
  appConfig = await loadConfig();
  MockFetchNewsUc fetchNewsUc = MockFetchNewsUc();
  NewsHeadlinePageNotifier newsHeadlinePageNotifier =
      NewsHeadlinePageNotifier(fetchNewsUc);

  var queryParameters = FetchNewsHeadlineParams(
    country: AppConstant.newsApiCountry,
    page: 1,
    pageSize: AppConstant.pageSize,
    apiKey: appConfig.newsApiKey,
  );

  var newsArticleEntityObjc = NewsArticleEntity(
    title: 'Title 1',
    description: 'Description 1',
    urlToImage: 'https://newsapi.com/image.png',
    url: 'https://newsapi.com/article1',
    author: 'author 1',
    publishedAt: '2022-02-21T12:00:00Z',
    content: 'content 1',
  );

  group('news headline page notifier ...', () {
    test('fetchNewsHeadlines() should load news headlines from the repository',
        () async {
      // Arrange
      when(() => fetchNewsUc.call(queryParameters))
          .thenAnswer((_) async => Future.value(right([
                newsArticleEntityObjc,
                newsArticleEntityObjc,
                newsArticleEntityObjc,
              ])));

      // Act
      await newsHeadlinePageNotifier.fetchNewsHeadline();

      // Assert
      expectLater(newsHeadlinePageNotifier.state.status, STATUS.loaded);
      expectLater(
          newsHeadlinePageNotifier.state.newArticles.first.title, 'Title 1');
    });
  });
}
