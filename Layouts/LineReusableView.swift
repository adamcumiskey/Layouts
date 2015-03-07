//
//  LineDecorationView.swift
//  Layouts
//
//  Created by Adam Cumiskey on 2/28/15.
//  Copyright (c) 2015 adamcumiskey. All rights reserved.
//

import UIKit
import ShapeKit

class LineReusableView: UICollectionReusableView {
    
    var lineWidth: CGFloat = 2.0
    var lineView: LineView!

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if lineView == nil {
            lineView = LineView()
            addSubview(lineView)
        }
        lineView.frame = bounds
        lineView.lineWidth = lineWidth
    }
}
