//
//  FuelTrackerUITests.swift
//  FuelTrackerUITests
//
//  Created by Daniel Zanchi on 16/10/2018.
//  Copyright © 2018 Daniel Zanchi. All rights reserved.
//

import XCTest
@testable import FuelTracker

class FuelTrackerUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launchArguments = ["-resetTable"]
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
        XCTAssert(app.navigationBars["Add Fuel"].exists)
    }
    
    func testTableView() {
        XCTAssertEqual(app.tables.count, 1)
    }
    
    func testTableViewRowCount() {
        let rows = app.tables.cells.count
        addFuel()
        XCTAssertEqual(app.tables.cells.count , rows + 1)
    }
    
    func testEditFuel() {
        addFuel()
        
        XCTAssertFalse(app.staticTexts["30.00 €"].exists)
        
        app.tables.cells.firstMatch.tap()
            
        let amountTextField = app.textFields["totalAmountTextField"]
        amountTextField.clearTextField()
        
        inputText(textFieldID: "totalAmountTextField", text: "30")
        
        app.navigationBars["Edit Fuel"].buttons["Save"].tap()
        
        XCTAssert(app.staticTexts["30.00 €"].exists) 
    }
    
    func testDeleteFuel() {
        addFuel()
        
        var rows = app.tables.cells.count
        XCTAssertEqual(rows, 1)
        
        app.tables.cells.firstMatch.swipeLeft()
        app.tables.cells.firstMatch.buttons["Delete"].tap()
        
        rows = app.tables.cells.count
        XCTAssertEqual(rows, 0)
    }
    
    func testEmptyTable() {
        XCTAssertEqual(app.tables.cells.count , 0)
    }
    
    
    // Helper to input text into a textfield with an identifier
    func addFuel() {        
        app.navigationBars["Fuel Register"].buttons["Add"].tap()
        
        inputText(textFieldID: "mileageTextField", text: "1000")
        inputText(textFieldID: "quantityTextField", text: "50")
        inputText(textFieldID: "totalAmountTextField", text: "100")
        XCUIApplication().navigationBars["Add Fuel"].buttons["Save"].tap()
    }
    
    func inputText(textFieldID: String, text: String) {
        let textField = app.textFields[textFieldID]
        textField.tap()
        
        textField.typeText(text)
    }

}

extension XCUIElement {
    func clearTextField() {
        self.tap()
        
        guard let stringValue = self.value as? String else {
            return
        }
        
        // workaround for apple bug
        if let placeholderString = self.placeholderValue, placeholderString == stringValue {
            return
        }
        
        var deleteString = String()
        for _ in stringValue {
            deleteString += XCUIKeyboardKey.delete.rawValue
        }
        self.typeText(deleteString)
    }
}
