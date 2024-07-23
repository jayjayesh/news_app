class AppConstant {
  static int pageSize = 10;
  // TODO : need to save this key at secure place : into env file
  // static String newsApiKey = 'YOUR_NEWS_API_KEY';
  static String newsApiCountry = 'us'; //'in';
  static String placeholderImage =
      'https://placehold.jp/30/969696/ffffff/300x150.png?text=news';
  // static String noImageUrl = 'https://placehold.co/600x400?text=news';

   static const noConnectionErrorMessage = 'Not connected to a network!';
   
}

enum STATUS {
  initial,
  loading,
  loaded,
  error,
}
