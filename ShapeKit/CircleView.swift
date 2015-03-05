//
//  CircleView.swift
//  Layouts
//
//  Created by Adam Cumiskey on 3/3/15.
//  Copyright (c) 2015 adamcumiskey. All rights reserved.
//

import QuartzCore
import UIKit

@IBDesignable class CircleView: UIView {
    
    @IBInspectable var circleColor: UIColor = UIColor.blueColor()
    @IBInspectable var ringColor: UIColor = UIColor.clearColor()
    @IBInspectable var ringThickness: CGFloat = CGFloat(5)
    @IBInspectable var pillShape: Bool = false
    
    var circleLayer: CAShapeLayer!
    var ringLayer: CAShapeLayer!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Cicle Layer
        if circleLayer == nil {
            initializeCircleLayer()
        }
        circleLayer.frame = layer.bounds
        
        // Ring Layer
        if ringLayer == nil {
            initializeRingLayer()
        }
        ringLayer.frame = CGRectInset(bounds, ringThickness/2, ringThickness/2)
    }
    
    func initializeCircleLayer() {
        circleLayer = CAShapeLayer()
        layer.addSublayer(circleLayer)
        
        let path = pathInRect(bounds, inset: circleLayer.lineWidth)
        circleLayer.path = path.CGPath
        circleLayer.fillColor = circleColor.CGColor
    }
    
    func initializeRingLayer() {
        ringLayer = CAShapeLayer()
        layer.addSublayer(ringLayer)
        
        let path = pathInRect(bounds, inset: 0)
        ringLayer.path = path.CGPath
        ringLayer.fillColor = nil
        ringLayer.strokeColor = ringColor.CGColor
        ringLayer.lineWidth = ringThickness
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
            
            // Calculate based on aspect ratio
            if rect.width > rect.height {
                r = rect.height/2
                point1 = CGPoint(x: r+inset, y: inset)
                point2 = CGPoint(x: (w-r)-inset, y: inset)
                point3 = CGPoint(x: (w-r)-inset, y: h)
                point4 = CGPoint(x: r+inset, y: h)
                c1 = CGPoint(x: r, y: r)
                c2 = CGPoint(x: w-r, y: r)
                
                // Apply path
                var path = CGPathCreateMutable()
                CGPathMoveToPoint(path, nil, point1.x, point1.y)
                CGPathAddLineToPoint(path, nil, point2.x, point2.y)
                CGPathAddArc(path, nil, c2.x, c2.y, r-inset, CGFloat(-M_PI/2), CGFloat(M_PI/2), false)
                CGPathAddLineToPoint(path, nil, point3.x, point3.y)
                CGPathAddLineToPoint(path, nil, point4.x, point4.y)
                CGPathAddArc(path, nil, c1.x, c1.y, r-inset, CGFloat(M_PI/2), CGFloat(-M_PI/2), false)
                CGPathCloseSubpath(path)
                
                return UIBezierPath(CGPath: path)
                
            } else {
                r = rect.width/2
                point1 = CGPoint(x: w+inset, y: r+inset)
                point2 = CGPoint(x: w+inset, y: h-r+inset)
                point3 = CGPoint(x: inset, y: h-r)
                point4 = CGPoint(x: inset, y: r)
                c1 = CGPoint(x: r, y: r)
                c2 = CGPoint(x: w-r+inset, y: h-r+inset)
                
                // Apply path
                var path = CGPathCreateMutable()
                CGPathMoveToPoint(path, nil, point1.x, point1.y)
                CGPathAddLineToPoint(path, nil, point2.x, point2.y)
                CGPathAddArc(path, nil, c2.x, c2.y, r-inset, CGFloat(0), CGFloat(M_PI), false)
                CGPathAddLineToPoint(path, nil, point3.x, point3.y)
                CGPathAddLineToPoint(path, nil, point4.x, point4.y)
                CGPathAddArc(path, nil, c1.x, c1.y, r-inset, CGFloat(M_PI), CGFloat(0), false)
                CGPathCloseSubpath(path)
                
                return UIBezierPath(CGPath: path)
            }
        }
        
        return UIBezierPath(ovalInRect: rect)
    }
}
