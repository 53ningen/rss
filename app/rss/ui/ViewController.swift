//
//  ViewController.swift
//  rss
//
//  Copyright (c) 2015年 gomi_ningen. All rights reserved.
//

import RxSwift
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSXMLParserDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.dataSource = self
        getEntries()
    }
    
    @IBAction func reloadEntries(sender: AnyObject) {
        getEntries()
        tableView.reloadData()
    }
    
    func getEntries() {
        view.addSubview(progressView)
        self.progressView.setProgress(0.2, animated: true)
        let url: NSURL = NSURL(string: "http://qiita.com/tags/swift/feed.atom")!
        let parser: NSXMLParser = NSXMLParser(contentsOfURL: url)!
        parser.delegate = self
        parser.parse()
        self.progressView.setProgress(1.0, animated: true)
        self.progressView.removeFromSuperview()
        
    }
    
    var token: String = ""
    var entries: [Entry] = []
    var currentElement: String? = nil
    var entryBuilder: EntryBuilder = EntryBuilder()
    
    func parserDidStartDocument(parser: NSXMLParser) {
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        switch elementName {
        case "entry":
            currentElement = elementName
        default:
            break
        }
        token = ""
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String?) {
        if let s = string {
            token = token + s
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if let elem = currentElement {
            switch elementName {
            case "entry":
                entries.append(entryBuilder.build())
                currentElement = nil
            case "id":
                entryBuilder.id = token
            case "name":
                entryBuilder.author = token
            case "published":
                entryBuilder.published = token
            case "updated":
                entryBuilder.updated = token
            case "url":
                entryBuilder.url = NSURL(string: token)
            case "title":
                entryBuilder.title = token
            case "content":
                break
            default:
                break
            }
        }
        token = ""
    }

    func parserDidEndDocument(parser: NSXMLParser) {
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
    
    @IBOutlet weak var tableViewCell: UITableViewCell!

    @IBOutlet weak var reloadButton: UIBarButtonItem!
    
    @IBOutlet var progressView: UIProgressView!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "cellSegue" {
            let articleViewController: ArticleViewController = segue.destinationViewController as! ArticleViewController
            articleViewController.url = targetUrl
        }
    }
    
}
