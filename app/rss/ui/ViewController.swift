//
//  ViewController.swift
//  rss
//
//  Copyright (c) 2015年 gomi_ningen. All rights reserved.
//

import RxSwift
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSXMLParserDelegate {

    var entries: [Entry] = []
    let entryRepo = EntryRepository()
    @IBOutlet weak var tableViewCell: UITableViewCell!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    @IBOutlet var progressView: UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.dataSource = self
        getEntries()
    }
    
    @IBAction func reloadEntries(sender: AnyObject) {
        getEntries()
    }
    
    func getEntries() {
        view.addSubview(progressView)
        self.progressView.setProgress(0.2, animated: true)
        entryRepo.getEntries(getEntries)
        self.progressView.setProgress(1.0, animated: true)
        self.progressView.removeFromSuperview()
    }
    
    func getEntries(entries: [Entry]?) -> Void {
        if let e = entries {
            self.entries = e
        }
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("articleCell", forIndexPath: indexPath) as! ArticleCell
        cell.setArticle(entries[indexPath.item])
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        tableView.resignFirstResponder()
        tableView.cellForRowAtIndexPath(indexPath)?.resignFirstResponder()
        targetUrl = entries[indexPath.item].url
        performSegueWithIdentifier("cellSegue", sender: nil)
    }
    
    var targetUrl: NSURL? = NSURL(string: "http://gochiusa.com")
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "cellSegue" {
            let articleViewController: ArticleViewController = segue.destinationViewController as! ArticleViewController
            articleViewController.url = targetUrl
        }
    }
    
}
