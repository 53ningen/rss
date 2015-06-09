//
//  Copyright (c) 2015年 gomi_ningen. All rights reserved.
//

import Foundation

public final class TagsFeedApiClient {
    
    private init() {
    }
    
    internal static let endpoint: String = "http://qiita.com/tags/swift/feed.atom"
    
    class func get(request: NSURLRequest, handler: (res: NSURLResponse!, data: NSData!, error: NSError!) -> Void) {
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: handler)
    }
    
    public class func getFeed(handler: (NSURLResponse!, NSData!, NSError!) -> Void) {
        let url: NSURL = NSURL(string: endpoint)!
        let req: NSURLRequest = NSURLRequest(URL: url)
        self.get(req, handler: handler)
    }

}
