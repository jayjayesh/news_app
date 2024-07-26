import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utility/app_exit_will_pop_scope_widget.dart';
import '../../../../core/utility/app_scaffold_body.dart';
import '../../../../core/providers/news_module_providers.dart';
import '../../../../news_pigeon.g.dart';

import '../../../settings/settings_view.dart';
import '../widgets/news_item_widget.dart';

class NewsListingPage extends ConsumerWidget {
  const NewsListingPage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 3 -------------------------
    // final selectedNewsSource = ref
    //     .watch(newsHeadlinePageNotifierProvider.select((value) => value))
    //     .source;
    final status = ref.watch(
        newsHeadlinePageNotifierProvider.select((value) => value.status));

    return AppExitWillPopScopeWidget(
      child: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onTap: () {
              if (status != STATUS.loading) {
                ref
                    .read(newsHeadlinePageNotifierProvider.notifier)
                    .onTapAllHeadline();
              }
            },
            child: const Text(
              'News Headlines',
              // selectedNewsSource.isEmpty ? 'Headlines' : 'All Headlines',
              // style: Theme.of(context).textTheme.headlineSmall,
            ), // Text displayed on the button
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
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
                    .fetchNewsHeadline();
              }
              return false;
            },
            child: Consumer(builder: (context, ref, child) {
              // 1 -------------------------
              final newArticles = ref.watch(newsHeadlinePageNotifierProvider
                  .select((value) => value.newArticles));
              // 2 -------------------------
              //final status = ref.watch(newsHeadlinePageNotifierProvider.select((value) => value.status));

              ///
              if (status != STATUS.loading && newArticles.isEmpty) {
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
                      if (status == STATUS.loading) {
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
                        imageUrl: item.urlToImage.isEmpty
                            ? AppConstant.placeholderImage
                            : item.urlToImage,
                        title: item.title,
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
                              .onTapNewsSource('${item.source?.name}', context);
                        });
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
