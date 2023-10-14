import 'package:news_app/src/core/network/constant/endpoints.dart';
import 'package:news_app/src/core/network/dio_client.dart';

class NewsAPI {
  final DioClient _dioClient;

  NewsAPI(this._dioClient);

  Future<Map<String, dynamic>> fetchNewsHeadlineApiRequest(
      Map<String, dynamic>? queryParameters) async {
    try {
      final res = await _dioClient.get(
        Endpoints.newsHeadline,
        queryParameters: queryParameters,
      );
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
