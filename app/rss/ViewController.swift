//
//  ViewController.swift
//  rss
//
//  Copyright (c) 2015年 gomi_ningen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let rssFeedUrl:NSURL = NSURL(string:"http://qiita.com/tags/swift/feed.atom")!
        let request: NSURLRequest = NSURLRequest(URL: rssFeedUrl)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: self.getHttp)
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.dataSource = self
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
    
    @IBOutlet weak var tableView: UITableView!
    
    let articles: [Article] = [
        Article(name: "ご注文はうさぎですか(1) ココア",  imageUrl: NSURL(string: "http://www.gochiusa.com/core_sys/images/main/cont/news/t_icon3/cocoa_anime.jpg")),
        Article(name: "ご注文はうさぎですか(2) チノ",    imageUrl: NSURL(string: "http://www.gochiusa.com/core_sys/images/main/cont/news/t_icon3/chino_anime.jpg")),
        Article(name: "ご注文はうさぎですか(3) リゼ",    imageUrl: NSURL(string: "http://www.gochiusa.com/core_sys/images/main/cont/news/t_icon3/rize_anime.jpg")),
        Article(name: "ご注文はうさぎですか(4) シャロ ", imageUrl: NSURL(string: "http://www.gochiusa.com/core_sys/images/main/cont/news/t_icon3/sharo_anime.jpg")),
        Article(name: "ご注文はうさぎですか(5) 千夜",    imageUrl: NSURL(string: "http://www.gochiusa.com/core_sys/images/main/cont/news/t_icon3/chiya_anime.jpg"))
    ]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("articleCell", forIndexPath: indexPath) as! ArticleCell
        cell.setArticle(articles[indexPath.item])
        return cell
    }
    
    @IBOutlet weak var tableViewCell: UITableViewCell!

    @IBOutlet weak var reloadButton: UIBarButtonItem!
    
    @IBAction func reload(sender: AnyObject) {
        
    }
    
}
