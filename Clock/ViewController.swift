//
//  ViewController.swift
//  Clock
//
//  Created by Joel Klabo on 2/19/15.
//  Copyright (c) 2015 Joel Klabo. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    @IBOutlet weak var clockView: ClockView!
    
    let zRotationKeyPath = "transform.rotation.z"
    var stopAnimation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.rotate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func valueChanged(sender: AnyObject) {
        let control = sender as UISegmentedControl
        
        switch control.selectedSegmentIndex {
        case 0:
            self.start()
        case 1:
            self.pause()
        case 2:
            self.clear()
        default:
            println("?")
        }
    }
    
    func rotate () {
        
        let angleToAdd = CGFloat(M_PI_4) / 2
        let currentAngle = self.clockView.layer.valueForKeyPath(zRotationKeyPath) as CGFloat
        let newAngle = currentAngle + angleToAdd

        self.clockView.layer.setValue(newAngle, forKeyPath: zRotationKeyPath)
        
        var rotateAnimation = CABasicAnimation(keyPath: zRotationKeyPath)
        
        rotateAnimation.duration = 0.0625
        rotateAnimation.additive = true
        rotateAnimation.removedOnCompletion = false
        rotateAnimation.fillMode = kCAFillModeForwards
        rotateAnimation.toValue = 0.0
        rotateAnimation.byValue = angleToAdd
        rotateAnimation.delegate = self
        
        self.clockView.layer.addAnimation(rotateAnimation, forKey: "rotation")
    }

    func start () {
        stopAnimation = false
        self.rotate()
    }
    
    func pause () {
        stopAnimation = true
    }
    
    func clear () {
        stopAnimation = true
        self.clockView.layer.setValue(CGFloat(0), forKeyPath: zRotationKeyPath)
    }
    
    // CABasicAnimationDelegate methods
    
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        if (anim == self.clockView.layer.animationForKey("rotation") && !stopAnimation) {
            self.rotate()
        }
    }
}

