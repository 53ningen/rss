//
//  ViewController.swift
//  rss
//
//  Copyright (c) 2015年 gomi_ningen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var topTextField: UITextField!
    
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var sendButton: UIButton!
    
    //    @IBAction func topButton(sender: AnyObject) {
    //        topLabel.text = "hoge"
    //        topLabel.textColor = UIColor.blueColor()
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.topTextField.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        topTextField.text = ""
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.sendButton.sendActionsForControlEvents(.TouchUpInside)
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAlert() {
        let VERSION: Float = (UIDevice.currentDevice().systemVersion as NSString).floatValue
        if VERSION >= 8.0 {
            let alertController: UIAlertController = UIAlertController(title: "ERROR", message: "Please enter your name", preferredStyle: .Alert)
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        } else {
            let alert = UIAlertView()
            alert.title = "ERROR"
            alert.message = "Please enter your name"
            alert.addButtonWithTitle("OK")
            alert.show()
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if identifier == "godSegue" {
            if topTextField.text == "" {
                showAlert()
                return false
            }
            else {
                return true
            }
        }
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "godSegue" {
            let godViewController: GodViewController = segue.destinationViewController as! GodViewController
            godViewController.godField = self.topTextField.text
            topTextField.resignFirstResponder()
        }
    }
    
}
