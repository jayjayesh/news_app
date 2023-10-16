//
//  News_Detail_VC.swift
//  Runner
//
//  Created by Lathiya Jayesh on 15/10/23.
//

import UIKit
import SDWebImage
import WebKit

class NewsDetailVC: UIViewController {
    var newsArticleModel: NewsArticleModelPigeon?
    
    @IBOutlet weak var imgThumbnail: UIImageView?
    @IBOutlet weak var lblTitle: UILabel?
    @IBOutlet weak var lblDescription: UITextView?
    @IBOutlet weak var lblAuthor: UILabel?
    @IBOutlet weak var lblDate: UILabel?
    @IBOutlet weak var webView: WKWebView?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        
        
    }
    
    func configureUI(){
        
        ///
        self.webView?.navigationDelegate = self
        self.webView?.uiDelegate = self
        self.webView?.allowsBackForwardNavigationGestures = true
        self.webView?.configuration.dataDetectorTypes = []
        ///
        guard let url = URL(string: newsArticleModel?.url ?? "") else {return}
        DispatchQueue.main.async  {
            self.webView?.load(URLRequest(url: url))
        }
        
        /*
        ///
        self.lblTitle?.text = newsArticleModel?.title
        self.lblDescription?.text = newsArticleModel?.description
        self.lblAuthor?.text = newsArticleModel?.source?.name
        
        ///
        self.lblDate?.text = newsArticleModel?.publishedAt?.UTCToLocal(incomingFormat: DATE_FORMATE.DATE1.rawValue, outGoingFormat: DATE_FORMATE.DATE10.rawValue)
        //self.lblDate?.text = newsArticleModel?.publishedAt
        
        ///
        let imageUrl = URL(string: newsArticleModel?.urlToImage ?? "")
        self.imgThumbnail?.sd_setImage(with: imageUrl, placeholderImage: UIImage(named:"placeholder_image"))
        
        */
        
    }
    
    func showActivityIndicator(show: Bool) {
           if show {
               progressView.startIndefinateProgress();
               //activityIndicator.startAnimating()
           } else {
               progressView.stopIndefinateProgress();
               //activityIndicator.stopAnimating()
           }
       }
    
}


extension NewsDetailVC: WKNavigationDelegate, WKUIDelegate {

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        // print("Started to load")
        showActivityIndicator(show: true)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // print("Finished loading")
        showActivityIndicator(show: false)
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        // print(error.localizedDescription)
        showActivityIndicator(show: false)
    }
}
