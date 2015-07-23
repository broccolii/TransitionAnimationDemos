//
//  MagicMoveTransition.swift
//  TransitionDemo02
//
//  Created by Broccoli on 15/7/22.
//  Copyright (c) 2015年 brocccoli. All rights reserved.
//

import UIKit

class MagicMoveTransition: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.3
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
    }
}
