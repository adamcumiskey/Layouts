//
//  CalendarEventCell.swift
//  Layouts
//
//  Created by Adam Cumiskey on 2/28/15.
//  Copyright (c) 2015 adamcumiskey. All rights reserved.
//

import UIKit

class CalendarEventCell: UICollectionViewCell {

    var color: UIColor = UIColor.whiteColor()
    
    override func drawRect(rect: CGRect) {
        self.layer.cornerRadius = self.frame.size.height/2.0
    }
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes!) {
        super.applyLayoutAttributes(layoutAttributes)
    }
    
}
