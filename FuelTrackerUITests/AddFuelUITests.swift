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
    
    func testPricePerUnit() {
        inputText(textFieldID: "quantityTextField", text: "50")
        inputText(textFieldID: "totalAmountTextField", text: "100")
        let pricePerUnitTextField = app.textFields["priceTextField"]
        XCTAssertEqual(pricePerUnitTextField.value as! String, "2.00")
    }
    
    func testPricePerUnitZero() {
        inputText(textFieldID: "quantityTextField", text: "50")
        inputText(textFieldID: "totalAmountTextField", text: "0")
        let pricePerUnitTextField = app.textFields["priceTextField"]
        XCTAssertEqual(pricePerUnitTextField.value as! String, "0.00")
    }
    
    func testTotalAmount() {
        inputText(textFieldID: "quantityTextField", text: "50")
        inputText(textFieldID: "priceTextField", text: "2")
        let totalAmountTextField = app.textFields["totalAmountTextField"]
        XCTAssertEqual(totalAmountTextField.value as! String, "100.00")
    }
    
    func testQuantityZero() {
        inputText(textFieldID: "quantityTextField", text: "0")
        let totalAmountTextField = app.textFields["totalAmountTextField"]
        let pricePerUnitTextField = app.textFields["priceTextField"]
        XCTAssertEqual(totalAmountTextField.isEnabled, false)
        XCTAssertEqual(pricePerUnitTextField.isEnabled, false)
        XCTAssertEqual("", totalAmountTextField.value as! String)
        XCTAssertEqual("", pricePerUnitTextField.value as! String)
    }
    
    func testDisabledTextFields() {
        let totalAmountTextField = app.textFields["totalAmountTextField"]
        let pricePerUnitTextField = app.textFields["priceTextField"]
        XCTAssertEqual(totalAmountTextField.isEnabled, false)
        XCTAssertEqual(pricePerUnitTextField.isEnabled, false)
        
        inputText(textFieldID: "quantityTextField", text: "100")
        XCTAssertEqual(totalAmountTextField.isEnabled, true)
        XCTAssertEqual(pricePerUnitTextField.isEnabled, true)
    }
    
    // Helper to input text into a textfield with an identifier
    func inputText(textFieldID: String, text: String) {
        let textField = app.textFields[textFieldID]
        textField.tap()
        textField.typeText(text)
    }

}
