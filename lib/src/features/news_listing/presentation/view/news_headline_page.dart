import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/core/constants/app_constants.dart';
import 'package:news_app/src/core/utility/app_scaffold_body.dart';
import 'package:news_app/src/features/news_listing/presentation/controller/news_headline_page_state.dart';
import 'package:news_app/src/features/news_listing/presentation/controller/news_headline_provider.dart';
import 'package:news_app/src/features/settings/settings_view.dart';

import '../widgets/news_item_widget.dart';

// https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=c1a571d9e5cd4ff3b161d9c7e248bd0f

class NewsListingPage extends ConsumerWidget {
  const NewsListingPage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1 -------------------------
    final newArticles = ref.watch(newsHeadlinePageNotifierProvider).newArticles;
    // 2 -------------------------
    final status = ref.watch(newsHeadlinePageNotifierProvider).status;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Headlines'),
        actions: [
          IconButton(
            icon: const Icon(Icons.south_rounded),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: AppScaffoldBody(
        child: NotificationListener(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent) {
              ref
                  .read(newsHeadlinePageNotifierProvider.notifier)
                  .fetchNewsHeadlines();
            }
            return false;
          },
          child: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 2));
              ref
                  .read(newsHeadlinePageNotifierProvider.notifier)
                  .pullToRefresh();
            },
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 50),
              //NOTE: BouncingScrollPhysics to avoid scroll-end shadow color which is theme accent color by default
              physics: const BouncingScrollPhysics(),
              itemCount: (newArticles.length) + 1,
              itemBuilder: (context, index) {
                ///--------------
                if (index == newArticles.length) {
                  if (status == NewsHeadlinePageStatus.loading) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 20),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                }

                ///--------------
                var item = newArticles[index];
                return NewsItemWidget(
                  imageUrl: item.urlToImage ?? AppConstant.placeholderImage,
                  title: '${item.title}',
                  description: item.description,
                  author: '${item.source?.name}',
                  publishedAt: DateTime.parse(item.publishedAt ?? ''),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
