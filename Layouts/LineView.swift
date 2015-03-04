//
//  LineView.swift
//  Layouts
//
//  Created by Adam Cumiskey on 3/2/15.
//  Copyright (c) 2015 adamcumiskey. All rights reserved.
//

import UIKit

/**
*  Meant to represent a single horizontal line
*  Note: Don't try to connect two of these together. There are much better ways to go about that.
*/
class LineView: UIView {

    var width = 1
    var color = UIColor.blackColor()
    var lineCap = kCALineCapRound
    
    override func drawRect(rect: CGRect) {
        // Perform Calculations
        // TODO: switch between verticle and horizontal line based on aspect ratio
        let midLine = self.frame.size.height/2.0
        let width = self.frame.size.width
        let origin = CGPointMake(0, midLine)
        let terminus = CGPointMake(width, midLine)
        
        // Calculate Path
        var path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, origin.x, origin.y)
        CGPathAddLineToPoint(path, nil, terminus.x, terminus.y)
        CGPathCloseSubpath(path)
        
        // Create the shape layer
        var lineShape = CAShapeLayer()
        lineShape.path = path
        lineShape.lineWidth = width
        lineShape.fillColor = color.CGColor
        lineShape.lineCap = lineCap
        
        // Add the sublayer
        
        layer.addSublayer(lineShape)
    }
}
