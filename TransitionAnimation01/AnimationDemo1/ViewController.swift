//
//  ViewController.swift
//  AnimationDemo1
//
//  Created by Broccoli on 15/7/18.
//  Copyright (c) 2015年 brocccoli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    let transitionManager = TransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func unwindToViewController (sender: UIStoryboardSegue) {
        
    }
    

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return self.presentingViewController == nil ? UIStatusBarStyle.Default : UIStatusBarStyle.LightContent
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        @IBOutlet weak var btnClicked: UIButton!
        @IBAction func btnClicked(sender: AnyObject) {
        }
        @IBAction func btnClicked(sender: AnyObject) {
        }
        @IBAction func btnClicked(sender: AnyObject) {
        }
        @IBAction func btnClicked(sender: AnyObject) {
        }
        
        let toViewController = segue.destinationViewController as! UIViewController
        
        toViewController.transitioningDelegate = self.transitionManager
        
    }
}

