//
//  AnimationView.swift
//  RxSwiftPractice
//
//  Created by yhoshino11 on 12/3/16.
//  Copyright © 2016 yhoshino11. All rights reserved.
//

import UIKit

class AnimationView: UIView, CAAnimationDelegate {
    
    func startCornerRadiusAndSizeAnimation() {
        
        // 角丸アニメーション
        let cornerRadiusAnimation: CABasicAnimation = CABasicAnimation(keyPath: "cornerRadius")
        cornerRadiusAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        cornerRadiusAnimation.fromValue = 0
        cornerRadiusAnimation.toValue = 150
        
        // サイズ変化アニメーション
        let sizeAnimation:CABasicAnimation = CABasicAnimation(keyPath: "bounds.size")
        sizeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        sizeAnimation.fromValue = NSValue(cgSize: CGSize(width: 100, height: 100))
        sizeAnimation.toValue = NSValue(cgSize: CGSize(width: 300, height: 300))
        
        // 角丸アニメーションとサイズ変化アニメーションをグループとして登録
        let animationGroup:CAAnimationGroup = CAAnimationGroup()
        animationGroup.setValue("group-animation1", forKey: "animationName")
        animationGroup.animations = [cornerRadiusAnimation, sizeAnimation]
        animationGroup.duration = 2.0
        animationGroup.delegate = self
        
        // アニメーションが終了した時の状態を維持する
        animationGroup.isRemovedOnCompletion = false
        animationGroup.fillMode = kCAFillModeForwards
        
        // アニメーショングループの追加
        self.layer.add(animationGroup, forKey: "group-animation")
    }
    
    func startCornerRadiusAnimation() {
        
        // 角丸アニメーション
        let cornerRadiusAnimation = CABasicAnimation(keyPath: "cornerRadius")
        cornerRadiusAnimation.fromValue = 0
        cornerRadiusAnimation.toValue = 100
        
        cornerRadiusAnimation.duration = 2.0
        
        // アニメーションが終了した時の状態を維持する
        cornerRadiusAnimation.isRemovedOnCompletion = false
        cornerRadiusAnimation.fillMode = kCAFillModeForwards
        
        // アニメーションが終了したらanimationDidStopを呼び出す
        cornerRadiusAnimation.delegate = self
        
        // アニメーションの追加
        self.layer.add(cornerRadiusAnimation, forKey: "cornerRadiusAnimation")
    }
}
