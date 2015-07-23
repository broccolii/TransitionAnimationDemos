//
//  TransitionManager.swift
//  TransitionDemo01
//
//  Created by Broccoli on 15/7/22.
//  Copyright (c) 2015年 brocccoli. All rights reserved.
//

import UIKit

class TransitionManager: UIPercentDrivenInteractiveTransition, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var presenting = true
    var interactive = false
    
    private var enterPanGesture: UIPanGestureRecognizer!
    private var exitPanGesture: UIPanGestureRecognizer!
    
    var fromViewController: ViewController! {
        didSet {
            self.enterPanGesture = UIPanGestureRecognizer()
            self.enterPanGesture.addTarget(self, action:"handleOnstagePan:")

            self.fromViewController.view.addGestureRecognizer(self.enterPanGesture)
        }
    }
    
    var toViewController: UIViewController! {
        didSet {
            self.exitPanGesture = UIPanGestureRecognizer()
            self.exitPanGesture.addTarget(self, action:"handleOffstagePan:")
            self.toViewController.view.addGestureRecognizer(self.exitPanGesture)
        }
    }
    
    func handleOnstagePan(pan: UIPanGestureRecognizer) {
        let translation = pan.translationInView(pan.view!)
        
        let d = (translation.y/1800) <= 1 ? (translation.y/1800) : 1
       
        switch (pan.state) {
            
        case UIGestureRecognizerState.Began:
            self.interactive = true
            self.fromViewController.performSegueWithIdentifier("presentSecondVC", sender: self)
            break
            
        case UIGestureRecognizerState.Changed:
           
            self.updateInteractiveTransition(d)
            break
            
        default:
            self.interactive = false
            if(d > 0.04){
                self.finishInteractiveTransition()
            } else {
                self.cancelInteractiveTransition()
            }
        }
    }
    func handleOffstagePan(pan: UIPanGestureRecognizer) {
        let translation = pan.translationInView(pan.view!)
        
        let d = -(translation.y/1800) <= 1 ? -(translation.y/1800) : 1
        
        switch (pan.state) {
            
        case UIGestureRecognizerState.Began:
            self.interactive = true
            self.toViewController.dismissViewControllerAnimated(true, completion: nil)
            break
            
        case UIGestureRecognizerState.Changed:
             println("d----\(d)")
            self.updateInteractiveTransition(d)
            break
            
        default:
            self.interactive = false
            if(d > 0.04){
                self.finishInteractiveTransition()
            } else {
                self.cancelInteractiveTransition()
            }
        }
    }
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView()
        
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let finalRect = transitionContext.finalFrameForViewController(toVC)
        if presenting {
            toVC.view.frame = CGRectOffset(finalRect, 0, UIScreen.mainScreen().bounds.height)
        } else {
            toVC.view.frame = CGRectOffset(finalRect, 0, -UIScreen.mainScreen().bounds.height)
        }
        container.addSubview(toVC.view)
    
        let duration = self.transitionDuration(transitionContext)
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            toVC.view.frame = finalRect
        }) { (finish) -> Void in
            transitionContext.completeTransition(true)
        }
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interactive ? self : nil
    }
    
    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.interactive ? self : nil
    }
}
