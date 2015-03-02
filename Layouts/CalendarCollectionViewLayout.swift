//
//  CalendarCollectionViewLayout.swift
//  Layouts
//
//  Created by Adam Cumiskey on 2/28/15.
//  Copyright (c) 2015 adamcumiskey. All rights reserved.
//

import UIKit

class CalendarCollectionViewLayout: UICollectionViewLayout {

    var headerHeight: CGFloat = 75
    var hourHeight: CGFloat = 100
    let hoursPerDay: Int = 24
    
    enum CalendarReusableViewElement {
        case ColumnHeader
        case RowHeader
        case HorizontalGridLine
        case VerticleGridLine
        case EventCell
        case EventCellPopover
        case EventCellLabel
    }
    
    override func collectionViewContentSize() -> CGSize {
        let width: CGFloat = self.collectionView!.frame.size.width
        let height: CGFloat = headerHeight + (hourHeight * CGFloat(hoursPerDay))
        return CGSizeMake(width, height)
    }
}
