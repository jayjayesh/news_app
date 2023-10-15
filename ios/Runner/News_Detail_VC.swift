//
//  News_Detail_VC.swift
//  Runner
//
//  Created by Lathiya Jayesh on 15/10/23.
//

import UIKit
import SDWebImage

class NewsDetailVC: UIViewController {
    var newsArticleModel: NewsArticleModelPigeon?
    
    @IBOutlet weak var imgThumbnail: UIImageView?
    @IBOutlet weak var lblTitle: UILabel?
    @IBOutlet weak var lblDescription: UITextView?
    @IBOutlet weak var lblAuthor: UILabel?
    @IBOutlet weak var lblDate: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI(){
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

    }
    
}
