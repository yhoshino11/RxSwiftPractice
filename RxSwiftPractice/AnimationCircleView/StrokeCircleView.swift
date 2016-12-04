//
//  StrokeCircleView.swift
//  RxSwiftPractice
//
//  Created by yhoshino11 on 12/4/16.
//  Copyright © 2016 yhoshino11. All rights reserved.
//

import UIKit

class StrokeCircleView: UIView {
    
    var circleLayer: CAShapeLayer!
    var currentProgress: Float!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupLayer() {
        self.currentProgress = 0.0
        self.backgroundColor = UIColor.clear
        let basePoint: CGPoint = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        let radius: CGFloat = bounds.size.width/2
        let pi = CGFloat(M_PI)
        
        let circlePath = UIBezierPath(arcCenter: basePoint,
                                      radius: frame.size.width/2,
                                      startAngle: -pi / 2,
                                      endAngle: 2 * pi - pi / 2,
                                      clockwise: true)
        
        circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.red.cgColor
        circleLayer.lineWidth = radius * 2
        
        circleLayer.strokeEnd = 0.0
        
        layer.addSublayer(circleLayer)
    }
    
    func animateCircle(duration: Float, progress: Float) {
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = CFTimeInterval(duration)
        animation.fromValue = self.currentProgress
        animation.toValue = progress
        
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        
        circleLayer.strokeEnd = CGFloat(progress)
        circleLayer.add(animation, forKey: "animateCircle")
        self.currentProgress = progress
    }
}
