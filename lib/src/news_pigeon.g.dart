// Autogenerated from Pigeon (v12.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';
List<Object?> wrapResponse({Object? result, PlatformException? error, bool empty = false}) {
  if (empty) {
    return <Object?>[];
  }
  if (error == null) {
    return <Object?>[result];
  }
  return <Object?>[error.code, error.message, error.details];
}

///
///
class NewsArticleSourceModelPigeon {
  NewsArticleSourceModelPigeon({
    this.id,
    this.name,
  });

  String? id;

  String? name;

  Object encode() {
    return <Object?>[
      id,
      name,
    ];
  }

  static NewsArticleSourceModelPigeon decode(Object result) {
    result as List<Object?>;
    return NewsArticleSourceModelPigeon(
      id: result[0] as String?,
      name: result[1] as String?,
    );
  }
}

class NewsArticleModelPigeon {
  NewsArticleModelPigeon({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  NewsArticleSourceModelPigeon? source;

  String? author;

  String? title;

  String? description;

  String? url;

  String? urlToImage;

  String? publishedAt;

  String? content;

  Object encode() {
    return <Object?>[
      source?.encode(),
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
    ];
  }

  static NewsArticleModelPigeon decode(Object result) {
    result as List<Object?>;
    return NewsArticleModelPigeon(
      source: result[0] != null
          ? NewsArticleSourceModelPigeon.decode(result[0]! as List<Object?>)
          : null,
      author: result[1] as String?,
      title: result[2] as String?,
      description: result[3] as String?,
      url: result[4] as String?,
      urlToImage: result[5] as String?,
      publishedAt: result[6] as String?,
      content: result[7] as String?,
    );
  }
}

class _NewsArticleHostApiCodec extends StandardMessageCodec {
  const _NewsArticleHostApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is NewsArticleModelPigeon) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is NewsArticleSourceModelPigeon) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return NewsArticleModelPigeon.decode(readValue(buffer)!);
      case 129: 
        return NewsArticleSourceModelPigeon.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class NewsArticleHostApi {
  /// Constructor for [NewsArticleHostApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  NewsArticleHostApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _NewsArticleHostApiCodec();

  Future<void> sendNewsDetail(NewsArticleModelPigeon arg_newsArticleModel) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.news_app.NewsArticleHostApi.sendNewsDetail', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_newsArticleModel]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }
}