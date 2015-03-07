//
//  CircleView.swift
//  Layouts
//
//  Created by Adam Cumiskey on 3/3/15.
//  Copyright (c) 2015 adamcumiskey. All rights reserved.
//

import QuartzCore
import UIKit

@IBDesignable public class CircleView: UIView {
    
    @IBInspectable var circleColor: UIColor = UIColor.blueColor()
    @IBInspectable var ringColor: UIColor = UIColor.clearColor() {
        didSet {
            setNeedsLayout()
        }
    }
    @IBInspectable var ringThickness: CGFloat = CGFloat(5) {
        didSet {
            setNeedsLayout()
        }
    }
    @IBInspectable var pillShape: Bool = false {
        didSet {
            setNeedsLayout()
        }
    }
    
    var circleLayer: CAShapeLayer!
    var ringLayer: CAShapeLayer!
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        // I kind of like the idea of enforcing transparency
        backgroundColor = UIColor.clearColor()
        
        // Cicle Layer
        if circleLayer == nil {
            initializeCircleLayer()
        }
        circleLayer.frame = layer.bounds
        
        let circlePath = pathInRect(bounds, inset: circleLayer.lineWidth)
        circleLayer.path = circlePath.CGPath
        circleLayer.fillColor = circleColor.CGColor
        
        
        // Ring Layer
        if ringLayer == nil {
            initializeRingLayer()
        }
        ringLayer.frame = bounds
        
        let path = pathInRect(bounds, inset: ringThickness/2)
        ringLayer.path = path.CGPath
        ringLayer.fillColor = nil
        ringLayer.strokeColor = ringColor.CGColor
        ringLayer.lineWidth = ringThickness
    }
    
    func initializeCircleLayer() {
        circleLayer = CAShapeLayer()
        layer.addSublayer(circleLayer)
    }
    
    func initializeRingLayer() {
        ringLayer = CAShapeLayer()
        layer.addSublayer(ringLayer)
    }
    
    func pathInRect(rect: CGRect, inset: CGFloat) -> UIBezierPath {
        if pillShape && rect.height != rect.width {

            // Declare constants and variables
            let w = rect.width
            let h = rect.height
            
            var r: CGFloat
            var point1: CGPoint!
            var point2: CGPoint!
            var point3: CGPoint!
            var point4: CGPoint!
            var c1: CGPoint!
            var c2: CGPoint!
            var theta1: CGFloat!
            var theta2: CGFloat!
            
            // Calculate values based on aspect ratio
            if rect.width > rect.height {
                r = rect.height/2
                point1 = CGPoint(x: r, y: inset)
                point2 = CGPoint(x: (w-r), y: inset)
                point3 = CGPoint(x: (w-r), y: h-inset)
                point4 = CGPoint(x: r, y: h-inset)
                c1 = CGPoint(x: r, y: r)
                c2 = CGPoint(x: w-r, y: r)
                theta1 = CGFloat(-M_PI/2)
                theta2 = CGFloat(M_PI/2)
            } else {
                r = rect.width/2
                point1 = CGPoint(x: w-inset, y: r)
                point2 = CGPoint(x: w-inset, y: h-r)
                point3 = CGPoint(x: inset, y: h-r)
                point4 = CGPoint(x: inset, y: r)
                c1 = CGPoint(x: r, y: r)
                c2 = CGPoint(x: w-r, y: h-r)
                theta1 = CGFloat(0)
                theta2 = CGFloat(M_PI)
            }
            
            // Create path
            var path = CGPathCreateMutable()
            CGPathMoveToPoint(path, nil, point1.x, point1.y)
            CGPathAddLineToPoint(path, nil, point2.x, point2.y)
            CGPathAddArc(path, nil, c2.x, c2.y, r-inset, theta1, theta2, false)
            CGPathAddLineToPoint(path, nil, point3.x, point3.y)
            CGPathAddLineToPoint(path, nil, point4.x, point4.y)
            CGPathAddArc(path, nil, c1.x, c1.y, r-inset, theta2, theta1, false)
            CGPathCloseSubpath(path)
            
            return UIBezierPath(CGPath: path)
        }
        
        return UIBezierPath(ovalInRect: CGRectInset(rect, inset, inset))
    }
}
