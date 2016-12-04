//
//  SampleAnimationView.swift
//  RxSwiftPractice
//
//  Created by yhoshino11 on 12/3/16.
//  Copyright © 2016 yhoshino11. All rights reserved.
//

import UIKit

class SampleAnimationView: UIView {
    
    func startAnimating() {
        
        let anim = CABasicAnimation(keyPath: "position")
        anim.duration = 2.5
        anim.repeatCount = 1
        anim.beginTime = CACurrentMediaTime() + 2
        anim.autoreverses = true
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        anim.fromValue = NSValue(cgPoint: CGPoint(x: 0, y: 0))
        anim.toValue = NSValue(cgPoint: CGPoint(x: 320, y: 480))
        anim.isRemovedOnCompletion = false
        anim.fillMode = kCAFillModeForwards
        self.layer.add(anim, forKey: "sample-animation")
    }
}
