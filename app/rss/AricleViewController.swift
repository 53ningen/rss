//
//  AricleViewController.swift
//  rss
//
//  Created by 柳　裕貴 on 2015/06/04.
//  Copyright (c) 2015年 gomi_ningen. All rights reserved.
//

import UIKit

class AricleViewController: UIViewController, UIWebViewDelegate {
    
    let gochiusaUrlString: String = "http://gochiusa.com"

    @IBAction func goBack(sender: AnyObject) {
        self.articleWebView.goBack()
    }
    @IBAction func goForward(sender: AnyObject) {
        self.articleWebView.goForward()
    }
    @IBAction func reflesh(sender: AnyObject) {
        self.articleWebView.reload()
    }

    @IBOutlet weak var articleWebView: UIWebView!
    
    func webViewDidStartLoad(webView: UIWebView) {
        
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        setupBottuonsEnabled()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.articleWebView.delegate = self
        if let url = NSURL(string: gochiusaUrlString) {
            let urlRequest = NSURLRequest(URL: url)
            self.articleWebView.loadRequest(urlRequest)
        }
        setupBottuonsEnabled()
    }
    
    func setupBottuonsEnabled() {
        self.backButton.enabled = self.articleWebView.canGoBack
        self.forwardButoon.enabled = self.articleWebView.canGoForward
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButoon: UIBarButtonItem!
    @IBOutlet weak var refleshButton: UIBarButtonItem!

}
