import 'package:http/http.dart' as http;

class ApiClientForUnitTest {
  static Future<dynamic> get({
    required String url,
    required Map<String, dynamic> params,
  }) async {
    Map<String, String> headers = {};

    // Convert the Map to a query string
    String queryString = Uri(queryParameters: params).query;
    // Parse the base URI
    Uri baseUri = Uri.parse(url);
    // Create the new URI with the appended query string
    Uri finalUri = baseUri.replace(query: queryString);

    ///
    final http.Response response = await http.get(
      finalUri,
      headers: headers,
    );

    return response;
  }
}
