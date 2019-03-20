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
    
    var mileageTextField: XCUIElement?
    var totalAmountTextField: XCUIElement?
    var pricePerUnitTextField: XCUIElement?
    var saveButton: XCUIElement?
    var partialFuelSwitch: XCUIElement?
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
        
        createElements()
        
        app.navigationBars["Fuel Register"].buttons["Add"].tap()
    }

    override func tearDown() {
        super.tearDown()
        app = nil
        totalAmountTextField = nil
        mileageTextField = nil
        pricePerUnitTextField = nil
        saveButton = nil
    }

    func testAddViewController() {
        XCTAssert(app.navigationBars["Add Fuel"].exists)
    }
    
    func testKeyBoardAppearsAndDisappears() {
        XCTAssertEqual(app.keyboards.count, 0)   
        
        mileageTextField?.tap()
        XCTAssertEqual(app.keyboards.count, 1)
        
        app.otherElements["view"].tap()
        XCTAssertEqual(app.keyboards.count, 0)
    }
    
    func testPricePerUnit() {
        inputText(textFieldID: "mileageTextField", text: "3000")
        inputText(textFieldID: "quantityTextField", text: "50")
        inputText(textFieldID: "totalAmountTextField", text: "100")
        XCTAssertEqual(pricePerUnitTextField?.value as! String, "2.000")
    }
    
    func testPricePerUnitZero() {
        inputText(textFieldID: "mileageTextField", text: "3000")
        inputText(textFieldID: "quantityTextField", text: "50")
        inputText(textFieldID: "totalAmountTextField", text: "0")
        XCTAssertEqual(pricePerUnitTextField?.value as! String, "0.00")
    }
    
    func testTotalAmount() {
        inputText(textFieldID: "mileageTextField", text: "3000")
        inputText(textFieldID: "quantityTextField", text: "50")
        inputText(textFieldID: "priceTextField", text: "2")
        XCTAssertEqual(totalAmountTextField?.value as! String, "100.00")
    }
    
    func testQuantityZero() {
        inputText(textFieldID: "quantityTextField", text: "0")
        XCTAssertEqual(totalAmountTextField?.isEnabled, false)
        XCTAssertEqual(pricePerUnitTextField?.isEnabled, false)
        XCTAssertEqual("", totalAmountTextField?.value as! String)
        XCTAssertEqual("", pricePerUnitTextField?.value as! String)
    }
    
    func testDisabledTextFieldsAndSaveButton() {        
        XCTAssertEqual(totalAmountTextField?.isEnabled, false)
        XCTAssertEqual(pricePerUnitTextField?.isEnabled, false)
        XCTAssertEqual(saveButton?.isEnabled, false)
    }
    
    func testDisabledTextFieldsAndSaveButton1() {        
        inputText(textFieldID: "mileageTextField", text: "3000")
        inputText(textFieldID: "quantityTextField", text: "100")
        XCTAssertEqual(totalAmountTextField?.isEnabled, true)
        XCTAssertEqual(pricePerUnitTextField?.isEnabled, true)
        XCTAssertEqual(saveButton?.isEnabled, true)
    }
    
    func testDisabledTextFieldsAndSaveButton2() {
        inputText(textFieldID: "mileageTextField", text: "0")
        inputText(textFieldID: "quantityTextField", text: "0")
        XCTAssertEqual(totalAmountTextField?.isEnabled, false)
        XCTAssertEqual(pricePerUnitTextField?.isEnabled, false)
        XCTAssertEqual(saveButton?.isEnabled, false)
    }
    
    func testDisabledTextFieldsAndSaveButton3() {        
        inputText(textFieldID: "mileageTextField", text: "3000")
        inputText(textFieldID: "quantityTextField", text: "0")
        XCTAssertEqual(totalAmountTextField?.isEnabled, false)
        XCTAssertEqual(pricePerUnitTextField?.isEnabled, false)
        XCTAssertEqual(saveButton?.isEnabled, false)
    }
    
    func testDisabledTextFieldsAndSaveButton4() {        
        inputText(textFieldID: "mileageTextField", text: "0")
        inputText(textFieldID: "quantityTextField", text: "100")
        XCTAssertEqual(totalAmountTextField?.isEnabled, false)
        XCTAssertEqual(pricePerUnitTextField?.isEnabled, false)
        XCTAssertEqual(saveButton?.isEnabled, false)
    }
    
    func testPartialFuelSwitchInitialState() {
        let isOn = partialFuelSwitch?.value as? String
        XCTAssertEqual(isOn, "0")
    }
    
    func testPartialFuelLabelInitialState() {
        XCTAssert(app.staticTexts["No"].exists)
    }
    
    func testPartialFuelLabelAfterSwitchIsOn() {
        partialFuelSwitch?.tap()
        XCTAssert(app.staticTexts["Yes"].exists)
    }
    
    func testPartialFuelMessageLabelInitialState() {
        let text = "When you don't fill up the tank it's not possible to calculate fuel consumption."
        XCTAssertFalse(app.staticTexts[text].exists)
    }
    
    func testPartialFuelMessageLabelAfterSwitchIsOn() {
        partialFuelSwitch?.tap()
        let text = "When you don't fill up the tank it's not possible to calculate fuel consumption."
        XCTAssert(app.staticTexts[text].exists)
    }
    
    func testSaveFuel() {
        inputText(textFieldID: "mileageTextField", text: "1000")
        inputText(textFieldID: "quantityTextField", text: "50")
        inputText(textFieldID: "totalAmountTextField", text: "100")
        XCUIApplication().navigationBars["Add Fuel"].buttons["Save"].tap()
    }
    
    // Helper to input text into a textfield with an identifier
    func inputText(textFieldID: String, text: String) {
        let textField = app.textFields[textFieldID]
        textField.tap()
        textField.typeText(text)
    }
    
    func createElements() {
        mileageTextField = app.textFields["mileageTextField"]
        totalAmountTextField = app.textFields["totalAmountTextField"]
        pricePerUnitTextField = app.textFields["priceTextField"]
        partialFuelSwitch = app.switches["partialFuelSwitch"]
        saveButton = app.buttons["Save"]
    }

}
