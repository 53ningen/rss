//
//  Article.swift
//  rss
//
//  Copyright (c) 2015年 gomi_ningen. All rights reserved.
//

import Foundation

class Article: NSObject {
    
    let title: String
    let url: NSURL?
    let imageUrl: NSURL?
    
    init(title: String, url: NSURL?, imageUrl: NSURL?) {
        self.title = title
        self.url = url
        self.imageUrl = imageUrl
    }

}
