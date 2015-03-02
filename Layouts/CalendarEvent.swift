//
//  ACCalendarEvent.swift
//  Layouts
//
//  Created by Adam Cumiskey on 3/1/15.
//  Copyright (c) 2015 adamcumiskey. All rights reserved.
//

import Foundation

/**
*  Represents an event that can be displayed on a Calendar
*/
public class CalendarEvent: Event {
    
    // MARK: Public property declarations
    
    /**
    When true, if the endDate gets set before the startDate
    the endDate will wrap around the clock to come after the startDate.
    When false, setting the endDate before the startDate will calculate a
    new startDate based on the current duration and the desired endDate.
    */
    public static var wrapEndDate: Bool = true
    
    /// Start date of the event
    public var startDate: NSDate
    
    /// End date of the event. Calculated from the startDate and duration
    public var endDate: NSDate {
        set (newEndDate) {
            switch newEndDate.compare(endDate) {
            case .OrderedDescending:
                duration = newEndDate.timeIntervalSince1970 - startDate.timeIntervalSince1970
            case .OrderedAscending:
                if CalendarEvent.wrapEndDate {
                    // If the endDate is before the start date, calculate the new duration caused by
                    // wrapping the endDate around to the next day.
                    duration = startDate.secondsToMidnight() + newEndDate.secondsFromMidnight()
                } else {
                    // If the newEndDate is set before the start time, maintain the duration
                    // and calculate the new startDate
                    startDate = newEndDate.dateByAddingTimeInterval(-duration)
                }
            case .OrderedSame:
                duration = 0
            }
        }
        get {
            return startDate.dateByAddingTimeInterval(duration)
        }
    }
    
    /// Duration in seconds
    public var duration: NSTimeInterval = 0
    
    // MARK: Initialization
    
    /**
    Default initializer
    
    :returns: An event with a start date of now
    */
    public init() {
        self.startDate = NSDate()
    }
    
    /**
    Initialize with a startDate
    
    :param: startDate The date to start the event
    
    :returns: An event that occurs at a moment
    */
    public init(startDate: NSDate) {
        self.startDate = startDate
    }
    
    /**
    Initialize with a startDate and endDate
    
    :param: startDate The date to start the event
    :param: duration
    
    :returns: An event that occurs for a time
    */
    public init(startDate: NSDate, duration: NSTimeInterval) {
        self.startDate = startDate
        self.duration = duration
    }
}