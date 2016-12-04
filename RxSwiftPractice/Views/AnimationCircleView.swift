//
//  AnimationCircleView.swift
//  RxSwiftPractice
//
//  Created by yhoshino11 on 12/3/16.
//  Copyright © 2016 yhoshino11. All rights reserved.
//

import UIKit

class AnimationCircleView: UIImageView {
    
    var duration: Float = 0.1
    var progress: Float = 0.0 {
        didSet {
            guard oldValue <= 1.0 else {
                return
            }
            self.animate(duration: self.duration, from: oldValue, to: progress)
        }
    }
    
    private var progressLayer: CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.initializeProgressLayer()
        self.layer.mask = self.progressLayer
        self.layer.masksToBounds = true
    }
    
    private func initializeProgressLayer() {
        let basePoint: CGPoint = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
        let pi = CGFloat(M_PI)
        let start = -pi / 2
        let end = pi * 2 - pi / 2
        let radius: CGFloat = bounds.size.width / 2
        let circlePath = UIBezierPath(arcCenter: basePoint, radius: radius, startAngle: start, endAngle: end, clockwise: true)
        
        self.progressLayer = CAShapeLayer()
        self.progressLayer.path = circlePath.cgPath
        self.progressLayer.fillColor = nil
        self.progressLayer.strokeColor = UIColor.white.cgColor
        self.progressLayer.lineWidth = radius * 2
        self.progressLayer.strokeEnd = 0.0
    }
    
    private func animate(duration: Float, from: Float, to: Float) {
        
        let anim = CABasicAnimation(keyPath: "strokeEnd")
        anim.duration = CFTimeInterval(duration)
        anim.fromValue = from
        anim.toValue = to
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        
        self.progressLayer.strokeEnd = CGFloat(to)
        self.progressLayer.add(anim, forKey: nil)
    }
}
