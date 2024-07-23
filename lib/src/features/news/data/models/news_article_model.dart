import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/src/features/news/domain/entities/news_article_entity.dart';
import 'package:news_app/src/news_pigeon.g.dart';
import 'news_article_source_model.dart';

@freezed
class NewsArticleModel extends NewsArticleEntity {
  NewsArticleModel({
    required super.author,
    required super.title,
    required super.description,
    required super.url,
    required super.urlToImage,
    required super.publishedAt,
    required super.content,
    super.source,
  });

  factory NewsArticleModel.fromJson(Map<String, dynamic> map) {
    return NewsArticleModel(
      author: (map['author'] ?? '') as String,
      title: (map['title'] ?? '') as String,
      description: (map['description'] ?? '') as String,
      url: (map['url'] ?? '') as String,
      urlToImage: (map['urlToImage'] ?? '') as String,
      publishedAt: (map['publishedAt'] ?? '') as String,
      content: (map['content'] ?? '') as String,
      source: map['source'] == null
          ? null
          : NewsArticleSourceModel.fromJson(
              map['source'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'author': author,
      'title': title,
      'description': title,
      'url': content,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
      'source': super.source.toString(), // FIXME: need to fix this
    };
  }
}
