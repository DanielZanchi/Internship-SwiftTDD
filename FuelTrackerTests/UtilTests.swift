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
        var double: Double = 314.256
        XCTAssertEqual(double.toString(decimals: 3), "314.256")
        double = 314.259
        XCTAssertEqual(double.toString(decimals: 2), "314.26")
        double = Double()
        XCTAssertEqual(double.toString(decimals: 0), "0")
    }
    
    func testDisabledTextFieldColor() {
        let textField = UITextField()
        textField.isEnabled = true
        XCTAssertEqual(textField.backgroundColor, UIColor.white)
        textField.isEnabled = false
        XCTAssertEqual(textField.backgroundColor, UIColor(red: 201/255, green: 193/255, blue: 195/255, alpha: 1.0))
    }
}
