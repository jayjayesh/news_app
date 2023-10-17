import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/core/constants/app_constants.dart';
import 'package:news_app/src/core/utility/app_scaffold_body.dart';
import 'package:news_app/src/features/news_listing/presentation/controller/news_headline_page_state.dart';
import 'package:news_app/src/features/news_listing/presentation/controller/news_headline_provider.dart';
import 'package:news_app/src/features/settings/settings_view.dart';
import 'package:news_app/src/news_pigeon.g.dart';
import '../widgets/news_item_widget.dart';

class NewsListingPage extends ConsumerWidget {
  const NewsListingPage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1 -------------------------
    final newArticles = ref.watch(newsHeadlinePageNotifierProvider).newArticles;
    // 2 -------------------------
    final status = ref.watch(newsHeadlinePageNotifierProvider).status;
    // 3 -------------------------
    final selectedNewsSource =
        ref.watch(newsHeadlinePageNotifierProvider).source;

    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            if (selectedNewsSource.isNotEmpty) {
              ref
                  .read(newsHeadlinePageNotifierProvider.notifier)
                  .onTapAllHeadline();
            }
          },
          child: Text(
            selectedNewsSource.isEmpty ? 'Headlines' : 'All Headlines',
            // style: Theme.of(context).textTheme.headlineSmall,
          ), // Text displayed on the button
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.south_rounded),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              // Navigator.restorablePushNamed(context, SettingsView.routeName);
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
          child: Builder(builder: (context) {
            if (status != NewsHeadlinePageStatus.loading &&
                newArticles.isEmpty) {
              return Center(
                child: Text(
                  'No Results Found',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              );
            }

            ///
            return RefreshIndicator(
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
                      onTap: () {
                        if (Platform.isIOS) {
                          var param = item.mapToNewsArticleModelPigeon();
                          NewsArticleHostApi().sendNewsDetail(param);
                        }
                      },
                      onTapAuthor: () {
                        ref
                            .read(newsHeadlinePageNotifierProvider.notifier)
                            .onTapNewsSource('${item.source?.name}');
                      });
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
