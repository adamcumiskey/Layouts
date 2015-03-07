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
@IBDesignable public class LineView: UIView {

    var lineShapeLayer: CAShapeLayer!
    
    @IBInspectable public var lineWidth: CGFloat = 5
    @IBInspectable public var color: UIColor = UIColor.blackColor()
    var lineCap = kCALineCapRound
    
     public override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = UIColor.clearColor()
        
        // Create the shape layer
        if lineShapeLayer == nil {
            lineShapeLayer = CAShapeLayer()
            layer.addSublayer(lineShapeLayer)
        }
        lineShapeLayer.frame = bounds
        lineShapeLayer.path = pathInRect(self.bounds).CGPath
        lineShapeLayer.lineWidth = lineWidth
        lineShapeLayer.strokeColor = color.CGColor
        lineShapeLayer.lineCap = lineCap
    }
    
    func pathInRect(rect: CGRect) -> UIBezierPath {
        let width = frame.size.width
        let height = frame.size.height
        
        var midLine: CGFloat!
        var origin: CGPoint!
        var terminus: CGPoint!
        
        if frame.width > frame.height {
            midLine = frame.size.height/2.0
            origin = CGPointMake(0, midLine)
            terminus = CGPointMake(width, midLine)
        } else {
            midLine = frame.size.width/2.0
            origin = CGPointMake(midLine, 0)
            terminus = CGPointMake(midLine, height)
        }

        // Calculate Path
        var path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, origin.x, origin.y)
        CGPathAddLineToPoint(path, nil, terminus.x, terminus.y)
        CGPathCloseSubpath(path)
        
        return UIBezierPath(CGPath: path)
    }
}
