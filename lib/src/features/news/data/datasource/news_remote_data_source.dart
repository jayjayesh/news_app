import 'package:news_app/src/core/network/constant/endpoints.dart';
import 'package:news_app/src/core/network/dio_client.dart';

abstract interface class NewsRemoteDataSource {
 Future<Map<String, dynamic>> fetchNewsHeadlineApiRequest(
      Map<String, dynamic>? queryParameters,
  );
} 

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final DioClient dioClient;

  NewsRemoteDataSourceImpl(this.dioClient);

  @override
  Future<Map<String, dynamic>> fetchNewsHeadlineApiRequest(
      Map<String, dynamic>? queryParameters) async {
    try {
      final res = await dioClient.get(
        Endpoints.newsHeadline,
        queryParameters: queryParameters,
      );
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
