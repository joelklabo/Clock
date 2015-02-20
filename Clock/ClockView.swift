//
//  ClockView.swift
//  Clock
//
//  Created by Joel Klabo on 2/19/15.
//  Copyright (c) 2015 Joel Klabo. All rights reserved.
//

import UIKit

@IBDesignable

class ClockView: UIView {
    
    @IBInspectable var lineColor: UIColor = UIColor.blueColor()
    @IBInspectable var lineWidth: CGFloat = 3.0

    override func drawRect(rect: CGRect) {
        
        let secondHandGap: CGFloat = lineWidth * 4
        
        // Draw outer circle
        let insetRect = CGRectInset(rect, (lineWidth/2), (lineWidth/2))
        var path = UIBezierPath(ovalInRect: insetRect)
        path.lineWidth = lineWidth
        lineColor.setStroke()
        path.stroke()
        
        // Draw second hand
        let center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
        var secondHandPath = UIBezierPath()
        secondHandPath.moveToPoint(center)
        secondHandPath.addLineToPoint(CGPointMake(center.x, CGRectGetMinY(rect) + secondHandGap))
        secondHandPath.lineWidth = lineWidth
        secondHandPath.lineCapStyle = kCGLineCapRound
        secondHandPath.stroke()
    }

}
