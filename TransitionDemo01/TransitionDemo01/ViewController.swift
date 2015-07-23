//
//  ViewController.swift
//  TransitionDemo01
//
//  Created by Broccoli on 15/7/22.
//  Copyright (c) 2015年 brocccoli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let transitionManager = TransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.transitionManager.fromViewController = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwindToMainViewController (sender: UIStoryboardSegue){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let toVC = segue.destinationViewController as! UIViewController
        toVC.transitioningDelegate = self.transitionManager
        
        self.transitionManager.toViewController = toVC
    }
}

