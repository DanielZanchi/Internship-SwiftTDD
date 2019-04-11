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
        
        var deleteString = String()
        for _ in self.value as! String {
            deleteString += XCUIKeyboardKey.delete.rawValue
        }
        self.typeText(deleteString)
    }
    
}
