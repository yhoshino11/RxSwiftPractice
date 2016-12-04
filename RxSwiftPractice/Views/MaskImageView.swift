//
//  MaskImageView.swift
//  RxSwiftPractice
//
//  Created by yhoshino11 on 12/3/16.
//  Copyright © 2016 yhoshino11. All rights reserved.
//

import UIKit

class MaskImageView: UIImageView {
    func setupMask() {
        let pi = CGFloat(M_PI_2)
        let start: CGFloat = 0.0
        let end: CGFloat = pi
        
        let path: UIBezierPath = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.width/2, y: self.frame.height/2))
        path.addArc(withCenter: CGPoint(x: self.frame.width/2, y: self.frame.height/2),
                    radius: self.frame.width/2,
                    startAngle: start,
                    endAngle: end,
                    clockwise: true)
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.orange.cgColor
        layer.path = path.cgPath
        self.layer.addSublayer(layer)
    }
    
    func update(progress: CGFloat) {
        let pi = CGFloat(M_PI_2)
        let start: CGFloat = 0.0
        let end: CGFloat = 2 * pi * progress
        
        let path: UIBezierPath = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.width/2, y: self.frame.height/2))
        path.addArc(withCenter: CGPoint(x: self.frame.width/2, y: self.frame.height/2),
                    radius: self.frame.width/2,
                    startAngle: start,
                    endAngle: end,
                    clockwise: true)
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.orange.cgColor
        layer.path = path.cgPath
        self.layer.addSublayer(layer)
    }
}
