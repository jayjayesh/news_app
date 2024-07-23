import 'package:news_app/src/news_pigeon.g.dart';

import 'news_article_source_entity.dart';

class NewsArticleEntity {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final NewsArticleSourceEntity? source;

  NewsArticleEntity({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    this.source,
  });

  ///
  NewsArticleModelPigeon mapToNewsArticleModelPigeon() {
    return NewsArticleModelPigeon(
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
      source: NewsArticleSourceModelPigeon(
        id: source?.id,
        name: source?.name,
      ),
    );
  }
}
