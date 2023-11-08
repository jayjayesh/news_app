import 'package:freezed_annotation/freezed_annotation.dart';
part 'news_article_source_model.freezed.dart';
part 'news_article_source_model.g.dart';

@freezed
class NewsArticleSourceModel with _$NewsArticleSourceModel {
  ///
  const factory NewsArticleSourceModel({
    @Default('') String id,
    @Default('') String name,
  }) = _NewsArticleSourceModel;

  ///
  factory NewsArticleSourceModel.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleSourceModelFromJson(json);
}
