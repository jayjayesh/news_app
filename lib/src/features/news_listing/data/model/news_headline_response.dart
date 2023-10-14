import 'package:news_app/src/features/news_listing/data/model/news_article_model.dart';

class NewsHeadlinesResponse {
  String? status;
  int? totalResults;
  List<NewsArticleModel>? articles;

  NewsHeadlinesResponse({this.status, this.totalResults, this.articles});

  NewsHeadlinesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <NewsArticleModel>[];
      json['articles'].forEach((v) {
        articles!.add(new NewsArticleModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
