import 'package:news_app/src/core/params/fetch_news_headline_params.dart';

class FetchSourceNewsHeadlineParams extends FetchNewsHeadlineParams {
  final String source;

  FetchSourceNewsHeadlineParams({
    required this.source,
    required super.country,
    required super.page,
    required super.pageSize,
    required super.apiKey,
  });

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'sources': source,
      'page': page,
      'pageSize': pageSize,
      'apiKey': apiKey,
    };
    
    return data;
  }
  
}
