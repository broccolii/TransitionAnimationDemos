//
//  ViewController.swift
//  AnimationDemo03
//
//  Created by Broccoli on 15/7/20.
//  Copyright (c) 2015年 brocccoli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let container = UIView()
    let redSquare = UIView()
    let blueSquare = UIView()
    
   
    
    @IBAction func animateButtonTapped(sender: AnyObject) {
       
         var views: (frontView: UIView, backView: UIView)
        if (self.redSquare.superview != nil) {
            views = (frontView: self.redSquare, backView: self.blueSquare)
        } else {
            views = (frontView: self.blueSquare, backView: self.redSquare)
        }
        let tansitionOptions = UIViewAnimationOptions.TransitionFlipFromLeft
        
        UIView.transitionWithView(self.container, duration: 1.0, options: tansitionOptions, animations: { () -> Void in
            views.frontView.removeFromSuperview()
            self.container.addSubview(views.backView)
        }) { (finished) -> Void in
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.container.frame = CGRectMake(60, 60, 200, 200)
        self.view.addSubview(container)
        
        self.redSquare.frame = CGRectMake(0, 0, 200, 200)
        self.blueSquare.frame = redSquare.frame
        
        self.redSquare.backgroundColor = UIColor.redColor()
        self.blueSquare.backgroundColor = UIColor.blueColor()
        
        self.container.addSubview(self.redSquare)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
}

