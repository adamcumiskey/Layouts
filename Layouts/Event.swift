//
//  Event.swift
//  Layouts
//
//  Created by Adam Cumiskey on 3/1/15.
//  Copyright (c) 2015 adamcumiskey. All rights reserved.
//

import Foundation

protocol Event {
    var startDate: NSDate { get set }
    var endDate: NSDate { get set }
    var duration: NSTimeInterval { set get }
}
