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
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setArticle(entry: Entry) {
        titleLabel.text = entry.title
        if let url = entry.url {
            var e: NSError?
            //let imageData: NSData? = NSData(contentsOfURL: url, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &e)
            thumbnailImage.image = UIImage(named: "cocoa.jpg")
        }
        dateLabel.text = entry.published
        authorLabel.text = entry.author
    }
    
    func setArticle(article: Article) {
        titleLabel.text = article.title
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
