//
//  AnimationLayer.swift
//  RxSwiftPractice
//
//  Created by yhoshino11 on 12/3/16.
//  Copyright © 2016 yhoshino11. All rights reserved.
//

import UIKit

class AnimationLayer: CAShapeLayer {
    
    func basicAnimation() -> CABasicAnimation {
        let pathAnimation = CABasicAnimation(keyPath: "storokeEnd")
        pathAnimation.duration = 3.0
        pathAnimation.fromValue = 0.0
        pathAnimation.toValue = 1.0
        return pathAnimation
    }
}
