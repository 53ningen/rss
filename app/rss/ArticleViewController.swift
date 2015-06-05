//
//  ArticleViewController.swift
//  rss
//
//  Created by 柳　裕貴 on 2015/06/04.
//  Copyright (c) 2015年 gomi_ningen. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController, UIWebViewDelegate {
    
    let defaultUrlString: String = "http://gochiusa.com"

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        initWebView()
        updateButtons()
    }
    
    func initWebView() {
        if let url = NSURL(string: defaultUrlString) {
            let request = NSURLRequest(URL: url)
            webView.loadRequest(request)
        }
    }

    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        if error.code != NSURLErrorCancelled {
            // doSomething
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    @IBOutlet weak var navItem: UINavigationItem!
    
    @IBAction func goBack(sender: AnyObject) {
        webView.goBack()
    }
    
    @IBAction func goForward(sender: AnyObject) {
        webView.goForward()
    }

    @IBAction func reload(sender: AnyObject) {
        webView.reload()
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
    }
   
    func webViewDidFinishLoad(webView: UIWebView) {
        updateButtons()
        updateNavBar()
    }
    
    func updateButtons() {
        backButton.enabled = webView.canGoBack
        forwardButton.enabled = webView.canGoForward
    }
    
    func updateNavBar() {
        navItem.title = webView.stringByEvaluatingJavaScriptFromString("document.title")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
