//
//  ViewController.swift
//  rss
//
//  Copyright (c) 2015年 gomi_ningen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let rssFeedUrl:NSURL = NSURL(string:"http://qiita.com/tags/swift/feed.atom")!
        let request: NSURLRequest = NSURLRequest(URL: rssFeedUrl)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: self.getHttp)
    }
    
    func getHttp(res: NSURLResponse?, data: NSData?, error: NSError?) {
        if let e = error {
            
        } else if let d = data {
            let responseData = NSString(data: d, encoding: NSUTF8StringEncoding)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    
    @IBAction func reload(sender: AnyObject) {
        
    }
    
}
