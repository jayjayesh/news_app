class FetchNewsHeadlineParams {
  final String? country;
  final String? source;
  final int page;
  final int pageSize;
  final String apiKey;

  FetchNewsHeadlineParams({
    this.country,
    this.source,
    required this.page,
    required this.pageSize,
    required this.apiKey,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'country': country,
      'sources': source,
      'page': page,
      'pageSize': pageSize,
      'apiKey': apiKey,
    };

    data.removeWhere((key, value) => value == null);
    return data;
  }

  // add copy with

  FetchNewsHeadlineParams copyWith({
    String? country,
    String? source,
    int? page,
    int? pageSize,
    String? apiKey,
  }) {
    return FetchNewsHeadlineParams(
      country: country,
      source: source,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      apiKey: apiKey ?? this.apiKey,
    );
  }
}
