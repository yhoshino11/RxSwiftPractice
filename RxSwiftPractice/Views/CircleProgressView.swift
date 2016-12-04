//
//  CircleProgressView.swift
//  RxSwiftPractice
//
//  Created by yhoshino11 on 12/3/16.
//  Copyright © 2016 yhoshino11. All rights reserved.
//

import UIKit

class CircleProgressLayer: CALayer {

    var progress: CGFloat = 0
    var lineWidth: CGFloat = 50
    var progressTintColor: UIColor = UIColor(red: 0.39, green: 0.58, blue: 0.93, alpha: 1)
    var trackTintColor: UIColor = UIColor.gray
    
    override init() {
        super.init()
    }
    
    override init(layer: Any) {
        if let layer = layer as? CircleProgressLayer {
            lineWidth = layer.lineWidth
            progressTintColor = layer.progressTintColor
            trackTintColor = layer.trackTintColor
        }
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class func needsDisplay(forKey key: String) -> Bool {
        if key == "progress" {
            return true
        }
        return super.needsDisplay(forKey: key)
    }
    
    override func draw(in ctx: CGContext) {
        
        let rect: CGRect = self.bounds
        let centerPoint: CGPoint = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let cx: CGFloat = centerPoint.x
        let cy: CGFloat = centerPoint.y
        let radius = min(rect.width / 2, rect.height / 2)
        
        let track: CGMutablePath = CGMutablePath()
        track.addArc(tangent1End: centerPoint, tangent2End: centerPoint, radius: radius)
    }
}

class CircleProgressView: UIView {

}
