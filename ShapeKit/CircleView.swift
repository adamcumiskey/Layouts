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
    
    @IBInspectable var circleColor: UIColor = UIColor.darkGrayColor()
    @IBInspectable var ringColor: UIColor = UIColor.blackColor()
    @IBInspectable var ringThickness: CGFloat = CGFloat(5)
    
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
        ringLayer.frame = layer.bounds
    }
    
    func initializeCircleLayer() {
        circleLayer = CAShapeLayer()
        layer.addSublayer(circleLayer)
        
        let path = UIBezierPath(ovalInRect: bounds)
        circleLayer.path = path.CGPath
        circleLayer.fillColor = circleColor.CGColor
    }
    
    func initializeRingLayer() {
        ringLayer = CAShapeLayer()
        layer.addSublayer(ringLayer)
        
        let rect = CGRectInset(bounds, ringThickness/2, ringThickness/2)
        let path = UIBezierPath(ovalInRect: rect)
        ringLayer.path = path.CGPath
        ringLayer.fillColor = nil
        ringLayer.strokeColor = ringColor.CGColor
        ringLayer.lineWidth = ringThickness
    }
}
