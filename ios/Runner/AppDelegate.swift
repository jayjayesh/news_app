import UIKit
import Flutter


private class PigeonApiImplementation: NewsArticleHostApi {

 func sendNewsDetail(newsArticleModel: NewsArticleModelPigeon) {
  
     if let vc = STORYBOARD.MAIN.instantiateViewController(withIdentifier: MAIN_STORYBOARD.NewsDetailVC.rawValue) as? NewsDetailVC {
     
         vc.newsArticleModel = newsArticleModel
         UIApplication.topViewController()!.present(vc, animated: true, completion: nil)
//         UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
     
     }
 
 }

}

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    let controller = window?.rootViewController as! FlutterViewController
    let api = PigeonApiImplementation()
    NewsArticleHostApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: api)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
