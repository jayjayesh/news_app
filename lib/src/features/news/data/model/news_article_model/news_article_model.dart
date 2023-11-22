import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/src/news_pigeon.g.dart';
import '../news_article_source_model/news_article_source_model.dart';

part 'news_article_model.freezed.dart';
part 'news_article_model.g.dart';

@freezed
class NewsArticleModel with _$NewsArticleModel {
  const factory NewsArticleModel({
    NewsArticleSourceModel? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) = _NewsArticleModel;

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleModelFromJson(json);

  /// Extra methods
  /// as per freezed documentation : to add manual methods in data_class
  /// Added constructor. Must not have any parameter
  const NewsArticleModel._();

  ///
  NewsArticleModelPigeon mapToNewsArticleModelPigeon() {
    return NewsArticleModelPigeon(
      author: this.author,
      title: this.title,
      description: this.description,
      url: this.url,
      urlToImage: this.urlToImage,
      publishedAt: this.publishedAt,
      content: this.content,
      source: NewsArticleSourceModelPigeon(
        id: this.source?.id,
        name: this.source?.name,
      ),
    );
  }
}

/// Extra
class NewsArticleModelMapper {}
