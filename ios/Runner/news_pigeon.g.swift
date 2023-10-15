// Autogenerated from Pigeon (v12.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)"
  ]
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

///
///
///
/// Generated class from Pigeon that represents data sent in messages.
struct NewsArticleSourceModelPigeon {
  var id: String? = nil
  var name: String? = nil

  static func fromList(_ list: [Any?]) -> NewsArticleSourceModelPigeon? {
    let id: String? = nilOrValue(list[0])
    let name: String? = nilOrValue(list[1])

    return NewsArticleSourceModelPigeon(
      id: id,
      name: name
    )
  }
  func toList() -> [Any?] {
    return [
      id,
      name,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct NewsArticleModelPigeon {
  var source: NewsArticleSourceModelPigeon? = nil
  var author: String? = nil
  var title: String? = nil
  var description: String? = nil
  var url: String? = nil
  var urlToImage: String? = nil
  var publishedAt: String? = nil
  var content: String? = nil

  static func fromList(_ list: [Any?]) -> NewsArticleModelPigeon? {
    var source: NewsArticleSourceModelPigeon? = nil
    if let sourceList: [Any?] = nilOrValue(list[0]) {
      source = NewsArticleSourceModelPigeon.fromList(sourceList)
    }
    let author: String? = nilOrValue(list[1])
    let title: String? = nilOrValue(list[2])
    let description: String? = nilOrValue(list[3])
    let url: String? = nilOrValue(list[4])
    let urlToImage: String? = nilOrValue(list[5])
    let publishedAt: String? = nilOrValue(list[6])
    let content: String? = nilOrValue(list[7])

    return NewsArticleModelPigeon(
      source: source,
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content
    )
  }
  func toList() -> [Any?] {
    return [
      source?.toList(),
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
    ]
  }
}
private class NewsArticleHostApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return NewsArticleModelPigeon.fromList(self.readValue() as! [Any?])
      case 129:
        return NewsArticleSourceModelPigeon.fromList(self.readValue() as! [Any?])
      default:
        return super.readValue(ofType: type)
    }
  }
}

private class NewsArticleHostApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? NewsArticleModelPigeon {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else if let value = value as? NewsArticleSourceModelPigeon {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class NewsArticleHostApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return NewsArticleHostApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return NewsArticleHostApiCodecWriter(data: data)
  }
}

class NewsArticleHostApiCodec: FlutterStandardMessageCodec {
  static let shared = NewsArticleHostApiCodec(readerWriter: NewsArticleHostApiCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol NewsArticleHostApi {
  func sendNewsDetail(newsArticleModel: NewsArticleModelPigeon) throws
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class NewsArticleHostApiSetup {
  /// The codec used by NewsArticleHostApi.
  static var codec: FlutterStandardMessageCodec { NewsArticleHostApiCodec.shared }
  /// Sets up an instance of `NewsArticleHostApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: NewsArticleHostApi?) {
    let sendNewsDetailChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.news_app.NewsArticleHostApi.sendNewsDetail", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      sendNewsDetailChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let newsArticleModelArg = args[0] as! NewsArticleModelPigeon
        do {
          try api.sendNewsDetail(newsArticleModel: newsArticleModelArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      sendNewsDetailChannel.setMessageHandler(nil)
    }
  }
}
