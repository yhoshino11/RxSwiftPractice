//
//  ViewController.swift
//  RxSwiftPractice
//
//  Created by yhoshino11 on 11/17/16.
//  Copyright © 2016 yhoshino11. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var circleView: StrokeCircleView!
    var currentProgress : Float = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        circleView.setupLayer()
    }
    
    @IBAction func updateCircleProgress(_ sender: UIButton) {
        if self.currentProgress == 1.0 {
            sender.isEnabled = false
            return
        }
        self.currentProgress = self.currentProgress + 0.1
        circleView.animateCircle(duration: 0.1, progress: self.currentProgress)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
