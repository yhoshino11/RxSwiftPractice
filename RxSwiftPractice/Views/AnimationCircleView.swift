//
//  AnimationCircleView.swift
//  RxSwiftPractice
//
//  Created by yhoshino11 on 12/3/16.
//  Copyright © 2016 yhoshino11. All rights reserved.
//

import UIKit

class AnimationCircleView: UIView {
    
    var pathLayer: CAShapeLayer!
    
    func startAnimating() {
        
        let pi = CGFloat(M_PI)
        let start: CGFloat = -pi / 2
        let end: CGFloat = start
        
        if self.pathLayer == nil {
            let shapeLayer = CAShapeLayer()
            shapeLayer.strokeColor = UIColor.gray.cgColor
            shapeLayer.fillColor = nil
            shapeLayer.lineWidth = 1.5
            shapeLayer.lineJoin = kCALineJoinBevel
            self.pathLayer = shapeLayer
        }
        
        let path: UIBezierPath = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.width/2, y: self.frame.height/2))
        path.addArc(withCenter: CGPoint(x: self.frame.width/2, y: self.frame.height/2),
                    radius: self.frame.width/2,
                    startAngle: start,
                    endAngle: end,
                    clockwise: true)
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.brown.cgColor
        layer.path = path.cgPath
        self.layer.addSublayer(layer)
    }
    
    func updateProgress(progress: CGFloat) {
        let basePoint: CGPoint = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        let pi: CGFloat = CGFloat(M_PI)
        let start: CGFloat = -pi / 2
        let end: CGFloat = 2 * pi * progress - pi / 2
        
        let path: UIBezierPath = UIBezierPath()
        path.move(to: basePoint)
        path.addArc(withCenter: basePoint,
                    radius: self.frame.width / 2,
                    startAngle: start,
                    endAngle: end,
                    clockwise: true)
        
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.brown.cgColor
        layer.path = path.cgPath
        self.layer.addSublayer(layer)
    }
}
