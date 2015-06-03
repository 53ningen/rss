//
//  ViewController.swift
//  rss
//
//  Copyright (c) 2015年 gomi_ningen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topTextField: UITextField!

    @IBOutlet weak var topLabel: UILabel!
    
//    @IBAction func topButton(sender: AnyObject) {
//        topLabel.text = "hoge"
//        topLabel.textColor = UIColor.blueColor()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let godViewController: GodViewController = segue.destinationViewController as! GodViewController
        godViewController.godField = self.topTextField.text        
    }

}
