import 'package:news_app/src/features/news_listing/presentation/view/news_headline_page.dart';
import 'package:news_app/src/routes/routes.dart';

class AppRoutes {
  static final routes = {
    Routes.newslisting: (context) => const NewsListingPage(),
    //Routes.settings: (context) =>  SettingsView(),
  };
}
