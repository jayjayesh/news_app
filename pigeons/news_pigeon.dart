import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/news_pigeon.g.dart',
  dartOptions: DartOptions(),
  // cppOptions: CppOptions(namespace: 'pigeon_example'),
  // cppHeaderOut: 'windows/runner/news_pigeon.g.h',
  // cppSourceOut: 'windows/runner/news_pigeon.g.cpp',
  // kotlinOut:
  //     'android/app/src/main/kotlin/dev/flutter/pigeon_example_app/news_pigeon.g.kt',
  // kotlinOptions: KotlinOptions(),
  javaOut: 'android/app/src/main/java/io/flutter/plugins/news_pigeon.java',
  javaOptions: JavaOptions(),
  swiftOut: 'ios/Runner/news_pigeon.g.swift',
  swiftOptions: SwiftOptions(),
  // objcHeaderOut: 'macos/Runner/news_pigeon.g.h',
  // objcSourceOut: 'macos/Runner/news_pigeon.g.m',
  //// Set this to a unique prefix for your plugin or application, per Objective-C naming conventions.
  // objcOptions: ObjcOptions(prefix: 'PGN'),
  // copyrightHeader: 'pigeons/copyright.txt',
  // dartPackageName: 'pigeon_news_package',
))

///
///
class NewsArticleSourceModel {
  String? id;
  String? name;

  NewsArticleSourceModel({this.id, this.name});
}

class NewsArticleModel {
  NewsArticleSourceModel? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsArticleModel(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});
}

@HostApi()
abstract class NewsArticleHostApi {
  void sendNewsDetail(NewsArticleModel newsArticleModel);
}
