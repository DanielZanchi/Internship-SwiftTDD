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
    
    func testStringToDoubleNotNil() {
        let string: String = "321.22"
        XCTAssertNotNil(string.doubleValue)
    }
    
    func testStringToDoubleType() {
        let string: String = "321.22"
        XCTAssert(string.doubleValue as Any is Double)
    }
    
    func testStringToDouble() {
        let string: String = "314.255"
        XCTAssertEqual(string.doubleValue, 314.255)
    }
    
    func testStringWithCommaToDouble() {
        let string: String = "314,255"
        XCTAssertEqual(string.doubleValue, 314.255)
    }
    
    func testReplaceCommaWithPoint() {
        let stringWithComma: String = "10,2"
        XCTAssertEqual(stringWithComma.replaceCommaWithPoint, "10.2")
    }
    
    func testStringToUIntNotNil() {
        XCTAssertNotNil("312.222".intValue)
    }
    
    func testStringToUInt() {
        let string: String = "314"
        XCTAssertEqual(string.intValue, 314)
    }
    
    func testDoubleToStringNotNil() {
        let double: Double = 321.22
        XCTAssertNotNil(double.toString(decimals: 0))
    }
    
    func testDoubleToStringThreeDec() {
        let double: Double = 314.256
        XCTAssertEqual(double.toString(decimals: 3), "314.256")
    }
    
    func testDoubleToStringOneDec() {
        let double: Double = 314.256
        XCTAssertEqual(double.toString(decimals: 1), "314.3")
    }
    
    func testDisabledTextFieldColorEnabled() {
        let textField = UITextField()
        textField.isEnabled = true
        XCTAssertEqual(textField.backgroundColor, UIColor.white)
        textField.isEnabled = false
        XCTAssertEqual(textField.backgroundColor, UIColor(red: 201/255, green: 193/255, blue: 195/255, alpha: 1.0))
    }
        
    func testCellIdentifier() {
        XCTAssertEqual("FuelTableViewCell", FuelTableViewCell.identifier)
    }
    
    func testDateToStringNotNil() {
        let date = Date(timeIntervalSince1970: 0)
        XCTAssertNotNil(date)
    }
    
    func testDateToStringType() {
        let date = Date(timeIntervalSince1970: 0)
        XCTAssert(date.toString(dateFormat: "dd/MM/YYY") as Any is String)
    }
    
    func testDateToString() {
        let date = Date(timeIntervalSince1970: 0)
        XCTAssertEqual("01/01/1970", date.toString(dateFormat: "dd/MM/YYY"))
    }
    
}
