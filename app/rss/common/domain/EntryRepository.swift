//
//  EntryRepository.swift
//  rss
//
//  Copyright (c) 2015年 gomi_ningen. All rights reserved.
//

import Foundation

public class EntryRepository {
    
    static let endpoint: NSURL = NSURL(string: "http://qiita.com/tags/swift/feed.atom")!
    
    public func getEntries(callback: ([Entry]?) -> Void) {
        func go(res: NSURLResponse?, data: NSData?, error: NSError?) {
            callback(EntryConverter.parseData(data!))
        }
        let req = NSURLRequest(URL: EntryRepository.endpoint)
        self.get(req, handler: go)
    }

    func get(request: NSURLRequest, handler: (res: NSURLResponse!, data: NSData!, error: NSError!) -> Void) {
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: handler)
    }
    
}
