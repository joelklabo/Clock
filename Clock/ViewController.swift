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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func valueChanged(sender: AnyObject) {
        let control = sender as UISegmentedControl
        
        switch control.selectedSegmentIndex {
        case 0:
            self.rotate()
        case 1:
            self.pause()
        case 2:
            self.reset()
        default:
            println("?")
        }
    }
    
    func rotate () {
 
        let duration: NSTimeInterval = 0.5
        let angle: CGFloat = CGFloat(M_PI)
        var rotateTransform: CGAffineTransform = CGAffineTransformRotate(self.clockView.transform, angle)
        
        UIView.animateWithDuration(duration, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.clockView.transform = CGAffineTransformRotate(self.clockView.transform, angle)
        }) { (Bool) -> Void in
            self.rotate()
        }
    }

    func pause () {
        println("pause")
    }
    
    func reset () {
        println("Clear")
    }
}

