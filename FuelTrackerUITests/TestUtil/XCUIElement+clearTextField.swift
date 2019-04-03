//
//  File.swift
//  FuelTrackerUITests
//
//  Created by Daniel Zanchi on 03/04/2019.
//  Copyright © 2019 Daniel Zanchi. All rights reserved.
//

import XCTest

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
