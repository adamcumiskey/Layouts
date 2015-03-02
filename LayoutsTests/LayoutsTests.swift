//
//  LayoutsTests.swift
//  LayoutsTests
//
//  Created by Adam Cumiskey on 2/28/15.
//  Copyright (c) 2015 adamcumiskey. All rights reserved.
//

import UIKit
import XCTest
import Layouts

class LayoutsTests: XCTestCase {
    
    let defaultEvent = CalendarEvent()
    let startDateEvent = CalendarEvent(startDate: NSDate().dateByAddingTimeInterval(3600))
    let durationEvent = CalendarEvent(startDate: NSDate(), duration: 1000)

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCalendarEventInitialization() {
        func testEvent(event: CalendarEvent) {
            let startDate = event.startDate
            let endDate = event.endDate
            let duration = event.duration
            
            XCTAssertNotNil(startDate, "No start date set")
            XCTAssertNotNil(endDate, "No end date set")
            XCTAssertNotNil(duration, "No duration set")
        }
        
        testEvent(defaultEvent)
        testEvent(startDateEvent)
        testEvent(durationEvent)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
