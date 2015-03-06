//
//  ShapeKitDemoViewController.swift
//  Layouts
//
//  Created by Adam Cumiskey on 3/5/15.
//  Copyright (c) 2015 adamcumiskey. All rights reserved.
//

import UIKit
import ShapeKit

let animationDuration = 10.0

class ShapeKitDemoViewController: UIViewController {
    
    @IBOutlet weak var circle: CircleView!
    lazy var collapsedWidth: CGFloat = self.circle.frame.height
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func expand(sender: AnyObject) {
        UIView.animateWithDuration(animationDuration, animations: {
            var frame = self.circle.frame
            frame.size.width = self.view.frame.width - self.circle.frame.origin.x*2
            self.circle.frame = frame
        }, completion: nil)
    }
}
