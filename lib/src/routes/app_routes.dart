import 'package:news_app/src/features/news/presentation/view/news_headline_page.dart';
import 'package:news_app/src/features/news/presentation/view/news_source_page.dart';
import 'package:news_app/src/routes/routes.dart';

class AppRoutes {
  static final routes = {
    Routes.newslisting: (context) => const NewsListingPage(),
    Routes.newsSourcelisting: (context) => const NewsSourceListingPage(),
    //Routes.settings: (context) =>  SettingsView(),
  };
}
