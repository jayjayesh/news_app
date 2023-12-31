import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/core/constants/app_constants.dart';
import 'package:news_app/src/core/utility/app_exit_will_pop_scope_widget.dart';
import 'package:news_app/src/core/utility/app_scaffold_body.dart';
import 'package:news_app/src/features/news/presentation/controller/news_headline_page_state.dart';
import 'package:news_app/src/features/news/presentation/controller/all_news_providers.dart';
import 'package:news_app/src/features/news/presentation/controller/news_source_page_state.dart';
import 'package:news_app/src/news_pigeon.g.dart';
import '../widgets/news_item_widget.dart';

class NewsSourceListingPage extends ConsumerWidget {
  const NewsSourceListingPage({super.key});

  static const routeName = '/newsSource';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1 -------------------------
    final source = ref.watch(newsSourcePageNotifierProvider).source;

    return Scaffold(
      appBar: AppBar(
        title: Text(source),
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
                  .read(newsSourcePageNotifierProvider.notifier)
                  .fetchNewsHeadline();
            }
            return false;
          },
          child: Builder(builder: (context) {
            // 1 -------------------------
            final newArticles =
                ref.watch(newsSourcePageNotifierProvider).newArticles;
            // 2 -------------------------
            final status = ref.watch(newsSourcePageNotifierProvider).status;
            debugPrint('NewsSourcePageState.status = $status');
            if (status == STATUS.loaded && newArticles.isEmpty) {
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
                // ref
                //     .read(newsSourcePageNotifierProvider.notifier)
                //     .pullToRefresh();
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
                        // ref
                        //     .read(newsSourcePageNotifierProvider.notifier)
                        //     .onTapNewsSource('${item.source?.name}', context);
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
