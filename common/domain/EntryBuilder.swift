//
//  EntryBuilder.swift
//  rss
//
//  Copyright (c) 2015年 gomi_ningen. All rights reserved.
//

import Foundation

public class EntryBuilder {

    public var id: String?
    public var published: String?
    public var updated: String?
    public var url: NSURL?
    public var title: String?
    public var author: String?

    public func build() -> Entry {
        return Entry(id: id!, published: published!, updated: updated!, url: url, title: title!, author: author!)
    }

}
