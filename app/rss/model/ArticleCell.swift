//
//  ArticleCell.swift
//  rss
//
//  Copyright (c) 2015年 gomi_ningen. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setArticle(article: Article) {
        titleLabel.text = article.name
        if let url = article.imageUrl {
            var e: NSError?
            let imageData: NSData? = NSData(contentsOfURL: url, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &e)
            if let data = imageData {
                thumbnailImage.image = UIImage(data: data)
            } else {
                thumbnailImage.image = UIImage(named: "cocoa.jpg")
            }
        }
    }

}
