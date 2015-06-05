//
//  Article.swift
//  rss
//
//  Copyright (c) 2015年 gomi_ningen. All rights reserved.
//

import Foundation

class Article: NSObject {
    
    let name: String
    let imageUrl: NSURL?
    
    init(name: String, imageUrl: NSURL?) {
        self.name = name
        self.imageUrl = imageUrl
    }
    
}
