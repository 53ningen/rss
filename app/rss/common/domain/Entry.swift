//
//  Entry.swift
//  rss
//
//  Copyright (c) 2015年 gomi_ningen. All rights reserved.
//

import Foundation

public class Entry: Printable {
    
    public let id: String
    public let published: String
    public let updated: String
    public let url: NSURL?
    public let title: String
    public let author: String
    
    public init(id: String, published: String, updated: String, url: NSURL?, title: String, author: String) {
        self.id = id
        self.published = published
        self.updated = updated
        self.url = url
        self.title = title
        self.author = author
    }
    
    public var description: String {
        return "Entry{id:\(id),title:\(title),author:\(author)}"
    }

}
