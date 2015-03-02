//
//  Date.swift
//  Layouts
//
//  Created by Adam Cumiskey on 3/1/15.
//  Copyright (c) 2015 adamcumiskey. All rights reserved.
//

import Foundation

let MonthsPerYear = 12
let DaysPerWeek = 7
let HoursPerDay = 24
let MinutesPerHour = 60
let SecondsPerMinute = 60

extension NSDate {
    
    /**
    Get a date in component form
    
    :returns: The NSDateComponents of the date
    */
    func components() -> NSDateComponents {
        let calendar = NSCalendar()
        return calendar.components(NSCalendarUnit.CalendarUnitDay|NSCalendarUnit.CalendarUnitHour|NSCalendarUnit.CalendarUnitMinute|NSCalendarUnit.CalendarUnitSecond, fromDate: self)
    }
    
    /**
    The time in seconds from midnight to the date
    
    :returns: The NSTimeInterval between the start of the day (midnight) and a date
    */
    func secondsFromMidnight() -> NSTimeInterval {
        return NSTimeInterval((components().hour * MinutesPerHour * SecondsPerMinute) + (components().minute * SecondsPerMinute) + components().second)
    }
    
    /**
    The time in seconds to midnight from the date
    
    :returns: The NSTimeInterval between the date and midnight
    */
    func secondsToMidnight() -> NSTimeInterval {
        return NSTimeInterval(((components().hour-HoursPerDay) * MinutesPerHour * SecondsPerMinute) + ((components().minute - MinutesPerHour) * SecondsPerMinute) + (components().second - SecondsPerMinute))
    }
}