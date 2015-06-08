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
        //TagsFeedApiClient.getFeed(getHttp)
        self.tableView.delegate = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.dataSource = self
    }
    
    func getHttp(res: NSURLResponse?, data: NSData?, error: NSError?) -> Void {
        if let e = error {
            
        } else if let d = data {
            let responseData = NSString(data: d, encoding: NSUTF8StringEncoding)
            println(responseData)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    let articles: [Article] = [
        Article(
            title: "ご注文はうさぎですか(1) ココア",
            url: NSURL(string: "http://www.gochiusa.com/contents/chara/cocoa.html"),
            imageUrl: NSURL(string: "http://www.gochiusa.com/core_sys/images/main/cont/news/t_icon3/cocoa_anime.jpg")
        ),
        Article(
            title: "ご注文はうさぎですか(2) チノ",
            url: NSURL(string: "http://www.gochiusa.com/contents/chara/chino.html"),
            imageUrl: NSURL(string: "http://www.gochiusa.com/core_sys/images/main/cont/news/t_icon3/chino_anime.jpg")
        ),
        Article(
            title: "ご注文はうさぎですか(3) リゼ",
            url: NSURL(string: "http://www.gochiusa.com/contents/chara/rize.html"),
            imageUrl: NSURL(string: "http://www.gochiusa.com/core_sys/images/main/cont/news/t_icon3/rize_anime.jpg")
        ),
        Article(
            title: "ご注文はうさぎですか(4) 千夜",
            url: NSURL(string: "http://www.gochiusa.com/contents/chara/chiya.html"),
            imageUrl: NSURL(string: "http://www.gochiusa.com/core_sys/images/main/cont/news/t_icon3/chiya_anime.jpg")
        ),
        Article(
            title: "ご注文はうさぎですか(5) シャロ ",
            url: NSURL(string: "http://www.gochiusa.com/contents/chara/syaro.html"),
            imageUrl: NSURL(string: "http://www.gochiusa.com/core_sys/images/main/cont/news/t_icon3/sharo_anime.jpg")
        )
    ]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("articleCell", forIndexPath: indexPath) as! ArticleCell
        cell.setArticle(articles[indexPath.item])
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        tableView.resignFirstResponder()
        tableView.cellForRowAtIndexPath(indexPath)?.resignFirstResponder()
        targetUrl = articles[indexPath.item].url
        performSegueWithIdentifier("cellSegue", sender: nil)
    }
    
    var targetUrl: NSURL? = NSURL(string: "http://gochiusa.com")
    
    @IBOutlet weak var tableViewCell: UITableViewCell!

    @IBOutlet weak var reloadButton: UIBarButtonItem!
    
    @IBAction func reload(sender: AnyObject) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "cellSegue" {
            let articleViewController: ArticleViewController = segue.destinationViewController as! ArticleViewController
            articleViewController.url = targetUrl
        }
    }
    
}
