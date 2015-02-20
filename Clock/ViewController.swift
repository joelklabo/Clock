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
        self.clockView.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func valueChanged(sender: AnyObject) {
        let control = sender as UISegmentedControl
        
        switch control.selectedSegmentIndex {
        case 0:
            self.clockView.start()
        case 1:
            self.clockView.pause()
        case 2:
            self.clockView.clear()
        default:
            println("?")
        }
    }
}

