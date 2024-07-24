import 'package:news_app/src/core/network/constant/endpoints.dart';
import 'package:news_app/src/core/network/dio_client.dart';

import '../../../../core/params/fetch_news_headline_params.dart';

abstract class NewsRemoteDataSource {
  Future<Map<String, dynamic>> fetchNewsHeadlineApiRequest(
      FetchNewsHeadlineParams queryParameters);
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final DioClient dioClient;

  NewsRemoteDataSourceImpl(this.dioClient);

  @override
  Future<Map<String, dynamic>> fetchNewsHeadlineApiRequest(
      FetchNewsHeadlineParams queryParameters) async {
    try {
      final res = await dioClient.get(
        Endpoints.newsHeadline,
        queryParameters: queryParameters.toJson(),
      );
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
