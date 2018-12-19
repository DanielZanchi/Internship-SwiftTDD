//
//  FuelTrackerUITests.swift
//  FuelTrackerUITests
//
//  Created by Daniel Zanchi on 16/10/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import XCTest
//import SwiftyMocky
@testable import FuelTracker

class FuelTrackerUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
        app = nil
    }

    func testTitle() {
        let fuelRegisterNavigationBar = app.navigationBars["Fuel Register"]
        let fuelRegisterTitle = fuelRegisterNavigationBar.otherElements["Fuel Register"]
        XCTAssert(fuelRegisterTitle.exists)
    }

    func testAddButton() {
        XCTAssert(app.navigationBars["Fuel Register"].exists)
        app.navigationBars["Fuel Register"].buttons["Add"].tap()
        XCTAssert(app.navigationBars["Add sFuel"].exists)
    }
    
    func testTableViewReload() {
    }

}
