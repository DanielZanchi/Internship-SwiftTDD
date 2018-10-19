//
//  AddFuelUITests.swift
//  FuelTrackerUITests
//
//  Created by Daniel Zanchi on 19/10/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import XCTest

class AddFuelUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
        
        app.navigationBars["Fuel Register"].buttons["Add"].tap()
    }

    override func tearDown() {
        super.tearDown()
        app = nil
    }

    func testAddViewController() {
        XCTAssert(app.navigationBars["Add Fuel"].exists)
    }
    
    func testKeyBoardAppearsAndDisappears() {
        XCTAssertEqual(app.keyboards.count, 0)   
        
        let mileageTextField = app.textFields["mileageTextField"]
        mileageTextField.tap()
        XCTAssertEqual(app.keyboards.count, 1)
        
        app.otherElements["view"].tap()
        XCTAssertEqual(app.keyboards.count, 0)
    }

}
