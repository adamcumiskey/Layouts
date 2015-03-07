//
//  CalendarCollectionViewLayout.swift
//  Layouts
//
//  Created by Adam Cumiskey on 2/28/15.
//  Copyright (c) 2015 adamcumiskey. All rights reserved.
//

import UIKit

enum CalendarReusableViewElement: String {
    case Line = "LineReusableViewElement"
    case TimeLabel = "TimeLabelReusableViewElement"
}

class CalendarCollectionViewLayout: UICollectionViewLayout {

    var headerHeight: CGFloat = 75
    var hourHeight: CGFloat = 100
    let hoursPerDay: Int = 24
    
    func registerViewClasses() {
        self.registerClass(LineReusableView.self, forDecorationViewOfKind: CalendarReusableViewElement.Line.rawValue)
        self.registerClass(TimeLabelReusableView.self, forDecorationViewOfKind: CalendarReusableViewElement.TimeLabel.rawValue)

    }
    
    override init() {
        super.init()
        self.registerViewClasses()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.registerViewClasses()
    }

    override func collectionViewContentSize() -> CGSize {
        let width: CGFloat = self.collectionView!.frame.size.width
        let height: CGFloat = headerHeight + (hourHeight * CGFloat(hoursPerDay))
        return CGSizeMake(width, height)
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        var attributes: [AnyObject]
        
        if let collectionView = collectionView {
            let origin = collectionView.contentOffset
            let size = collectionView.bounds.size
            let visibleRect = CGRectMake(origin.x, origin.y, size.width, size.height)
            
            if CGRectIntersectsRect(visibleRect, rect) {
                
            }
        }
        
        return attributes
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
        return UICollectionViewLayoutAttributes()
    }
    
    override func layoutAttributesForDecorationViewOfKind(elementKind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
        var attributes: UICollectionViewLayoutAttributes = super.layoutAttributesForDecorationViewOfKind(elementKind, atIndexPath: indexPath)
        
        
        return attributes
    }
}
