//
//  ViewController.swift
//  RxSwiftPractice
//
//  Created by yhoshino11 on 11/17/16.
//  Copyright © 2016 yhoshino11. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var animationCircleView: AnimationCircleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationCircleView.duration = 0.1
    }
    
    @IBAction func updateCircleProgress(_ sender: UIButton) {
        self.animationCircleView.progress += 0.05
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
