//
//  ViewController.swift
//  AnimationDemo04
//
//  Created by Broccoli on 15/7/21.
//  Copyright (c) 2015年 brocccoli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 初始化 小方块
        let square = UIView()
        square.frame = CGRectMake(55, 300, 20, 20)
        square.backgroundColor = UIColor.redColor()
        self.view.addSubview(square)
        
        // 绘制 贝塞尔曲线 
        let path = UIBezierPath()
        // 起始点
        path.moveToPoint(CGPoint(x: 16, y: 10))
        // 重点 控制点 控制点
        path.addCurveToPoint(CGPoint(x: 301, y: 239), controlPoint1: CGPoint(x: 136, y: 373), controlPoint2: CGPoint(x: 178, y: 110))
        
        let anima = CAKeyframeAnimation(keyPath: "position")
        anima.path = path.CGPath
        
        anima.rotationMode = kCAAnimationRotateAuto
        anima.repeatCount = Float.infinity
        anima.duration = 5.0
        
        square.layer.addAnimation(anima, forKey: "animate position along path")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

