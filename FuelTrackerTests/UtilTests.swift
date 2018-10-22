//
//  UtilTests.swift
//  FuelTrackerTests
//
//  Created by Daniel Zanchi on 22/10/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import XCTest
@testable import FuelTracker 

class UtilTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testStringToDouble() {
        var string: String = "314.255" 
        XCTAssertEqual(string.doubleValue, 314.255)
        string = String()
        XCTAssertEqual(string.doubleValue, 0.0)
    }
    
    func testDoubleToString() {
        var double: Double = 314.25
        XCTAssertEqual(double.stringValue, "314.25")
        double = 314.259
        XCTAssertEqual(double.stringValue, "314.26")
        double = Double()
        XCTAssertEqual(double.stringValue, "0.00")
    }
}
