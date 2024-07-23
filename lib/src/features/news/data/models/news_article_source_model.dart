import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/src/features/news/domain/entities/news_article_source_entity.dart';

@freezed
class NewsArticleSourceModel extends NewsArticleSourceEntity {
  ///
  NewsArticleSourceModel({
    required super.id,
    required super.name,
  });

  factory NewsArticleSourceModel.fromJson(Map<String, dynamic> map) {
    return NewsArticleSourceModel(
      id: (map['id'] ?? '') as String,
      name: (map['name'] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'id': id, 'name': name};
  }
}
