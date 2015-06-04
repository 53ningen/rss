//
//  AricleViewController.swift
//  rss
//
//  Created by 柳　裕貴 on 2015/06/04.
//  Copyright (c) 2015年 gomi_ningen. All rights reserved.
//

import UIKit

class AricleViewController: UIViewController {

    @IBOutlet weak var articleWebView: UIWebView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        articleWebView.loadHTMLString("<br><br><br><br><br><br><b>hoge</b>", baseURL: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

}
