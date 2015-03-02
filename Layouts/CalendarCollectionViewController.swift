//
//  CalendarCollectionViewController.swift
//  Layouts
//
//  Created by Adam Cumiskey on 2/28/15.
//  Copyright (c) 2015 adamcumiskey. All rights reserved.
//

import UIKit

class CalendarCollectionViewController: UICollectionViewController {

    var numberOfSections: Int = 3
    var itemsPerSection: Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        
    }
    
    
    // MARK: UICollectionViewDataSource
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return self.numberOfSections
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemsPerSection
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> CalendarEventCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CalendarEventCell", forIndexPath: indexPath) as! CalendarEventCell
        return cell
    }
}
